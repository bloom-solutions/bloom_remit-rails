module BloomRemit
  module Txns
    class RunHook

      extend LightService::Action
      expects :txn, :response

      executed do |c|
        OnUpdate.(c.txn, c.response.body)
      end

    end
  end
end
