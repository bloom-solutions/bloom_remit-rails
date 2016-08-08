module BloomRemit
  module Api
    module V1
      class TxnsController < ::BloomRemit::ApplicationController

        respond_to :json

        def post_update
          op = Txns::Operations::Update.(params)
          render json: op.model
        end

        def update
          respond Txns::Operations::Update
        end

      end
    end
  end
end
