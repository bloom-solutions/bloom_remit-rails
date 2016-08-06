require 'rails_helper'

module BloomRemit
  module Txns
    RSpec.describe RunHook do

      let(:txn) { build_stubbed(:txn) }
      let(:response) { build_stubbed(:response, body: {is: "body"}) }

      it "calls on OnUpdate, passing the response's body" do
        expect(OnUpdate).to receive(:call).with(txn, {is: "body"})
        described_class.execute(txn: txn, response: response)
      end

    end
  end
end
