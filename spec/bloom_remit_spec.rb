require 'rails_helper'

RSpec.describe BloomRemit do

  it "is configurable" do
    BloomRemit.configure do |c|
      c.token = "token"
      c.secret = "secret"
      c.url = "https://url.com"
      c.agent_id = "agent_id"
    end

    expect(described_class.token).to eq "token"
    expect(described_class.secret).to eq "secret"
    expect(described_class.url).to eq "https://url.com"
    expect(described_class.agent_id).to eq "agent_id"
  end

end
