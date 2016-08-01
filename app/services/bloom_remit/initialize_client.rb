module BloomRemit
  class InitializeClient

    extend LightService::Action
    promises :client

    executed do |c|
      c.client = BloomRemitClient.new(
        token: BloomRemit.token,
        secret: BloomRemit.secret,
        agent_id: BloomRemit.agent_id,
        url: BloomRemit.url,
      )
    end

  end
end
