require 'rails_helper'

module BloomRemit
  RSpec.describe InitializeClient do

    it "initializes a BloomRemitClient and places it in the context" do
      BloomRemit.configure do |c|
        c.token = "token"
        c.secret = "secret"
        c.agent_id = "agent_id"
        c.url = "url.com"
      end

      client = described_class.execute.client

      expect(client.token).to eq "token"
      expect(client.secret).to eq "secret"
      expect(client.agent_id).to eq "agent_id"
      expect(client.url).to eq "url.com"
    end

  end
end
