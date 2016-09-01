module BloomRemit
  module Txns
    class HandleResponse

      extend LightService::Action
      expects :txn, :remote_response
      promises :response

      executed do |c|
        remote_response = c.remote_response
        c.txn.error! unless remote_response.success?
        body = remote_response.body
        c.response = c.txn.responses.create!(body: body)
      end

    end
  end
end
