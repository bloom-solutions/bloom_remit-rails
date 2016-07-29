require 'rails_helper'

module BloomRemit
  RSpec.describe SyncBillersJob do

    it { is_expected.to be_retryable false }

    it "copies billers" do
      expect(Billers::Sync).to receive(:call)
      described_class.new.perform
    end

  end
end
