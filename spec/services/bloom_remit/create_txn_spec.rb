require 'rails_helper'

module BloomRemit
  RSpec.describe CreateTxn, vcr: {record: :once} do

    it "creates a model and pays for the bill" do
      BloomRemit.configure do |c|
        c.token = ENV["BLOOM_REMIT_TOKEN"]
        c.secret = ENV["BLOOM_REMIT_SECRET"]
        c.agent_id = ENV["BLOOM_REMIT_AGENT_ID"]
        c.url = ENV["BLOOM_REMIT_URL"]
      end

      Billers::Sync.()

      user = create(:bloom_remit_dummy_user)
      biller = Biller.find_by(slug: "PLDT")

      txn = CreateTxn.(
        recipient: biller,
        sender: user,
        amount: 800.0,
        account_name: "028109090",
        account_id: "Hooli X",
      ).model

      expect(txn).to be_incomplete
      expect(txn.secret).to be_present
    end

  end
end
