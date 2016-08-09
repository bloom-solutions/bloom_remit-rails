module BloomRemit
  module Txns
    module Operations
      class Update < Trailblazer::Operation

        include Model
        model Txn, :update

        contract Contracts::Update

        include Callback
        callback :after_update do
          on_change :after_update
        end

        def process(params)
          validate(params[:txn]) do |f|
            if f.save
              dispatch! :after_update
            end
          end
        end

        private

        def setup_params!(params)
          params[:txn] ||= {}
          params[:txn].merge!(params.slice(*%i[
            status
            status_description
          ]))
        end

        def model!(params)
          Txn.find_by!(id: params[:id], secret: params[:secret])
        end

        def after_update(form, opts)
          ActiveRecord::Base.after_transaction do
            OnUpdateJob.perform_async(form.model.id, opts[:params][:txn])
          end
        end

      end
    end
  end
end
