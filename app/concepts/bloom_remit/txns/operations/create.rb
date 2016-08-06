module BloomRemit
  module Txns
    module Operations
      class Create < Trailblazer::Operation

        include Model
        model Txn, :create

        contract Contracts::Create

        include Dispatch
        callback :after_create do
          on_change :after_create
        end

        def process(params)
          validate(params[:txn]) do |f|
            f.model.secret = SecureRandom.uuid
            f.save
            dispatch! :after_create
          end
        end

        private

        def after_create(form, opts)
          PayoutJob.perform_async(form.model.id)
        end

      end
    end
  end
end
