module BloomRemit
  module Txns
    module Operations
      class Update < Trailblazer::Operation

        include Model
        model Txn, :update

        contract Contracts::Update

        def process(params)
          validate(params[:txn]) do |f|
            f.save
          end
        end

        private

        def model!(params)
          Txn.find_by!(id: params[:id], secret: params[:secret])
        end

      end
    end
  end
end
