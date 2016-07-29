require 'rails_helper'

module BloomRemit
  module Billers
    RSpec.describe Sync do

      it "syncs the billers with the local system", vcr: {record: :once} do
        BloomRemit.configure do |c|
          c.token = ENV["BLOOM_REMIT_TOKEN"]
          c.secret = ENV["BLOOM_REMIT_SECRET"]
          c.agent_id = ENV["BLOOM_REMIT_AGENT_ID"]
          c.url = ENV["BLOOM_REMIT_URL"]
        end

        described_class.()
        expect(Biller.all).to_not be_empty
      end

    end
  end
end
