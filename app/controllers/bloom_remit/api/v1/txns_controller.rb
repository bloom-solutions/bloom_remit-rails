module BloomRemit
  module Api
    module V1
      class TxnsController < ApplicationController

        respond_to :json

        def update
          respond Txns::Operations::Update
        end

      end
    end
  end
end
