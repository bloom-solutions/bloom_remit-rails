require 'rails_helper'

module BloomRemit
  module Billers
    RSpec.describe Sync do

      it "syncs the billers with the local system", vcr: {record: :once} do
        described_class.()
        expect(Biller.all).to_not be_empty
      end

    end
  end
end
