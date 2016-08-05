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
          params[:txn].merge!(
            status: params[:status],
            secret: params[:secret],
          )
        end

        def model!(params)
          Txn.find_by!(id: params[:id], secret: params[:secret])
        end

        def after_update(form, opts)
          OnUpdateJob.perform_async(form.model.id)
        end

      end
    end
  end
end
