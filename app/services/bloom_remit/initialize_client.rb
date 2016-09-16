module BloomRemit
  class InitializeClient

    extend LightService::Action
    promises :client

    executed do |c|
      c.client = BloomRemitClient.new(
        api_token: BloomRemit.token,
        api_secret: BloomRemit.secret,
        agent_id: BloomRemit.agent_id,
        sandbox: BloomRemit.sandbox,
      )
    end

  end
end
