require 'rails_helper'

module BloomRemit
  RSpec.describe InitializeClient do

    it "initializes a BloomRemitClient and places it in the context" do
      BloomRemit.configure do |c|
        c.token = "token"
        c.secret = "secret"
        c.agent_id = "agent_id"
        c.sandbox = true
      end

      client = described_class.execute.client

      expect(client.api_token).to eq "token"
      expect(client.api_secret).to eq "secret"
      expect(client.agent_id).to eq "agent_id"
      expect(client.host).to eq BloomRemitClient::STAGING
    end

  end
end
