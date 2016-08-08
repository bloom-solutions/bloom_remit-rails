require 'rails_helper'

module BloomRemit
  module Txns
    module Contracts
      RSpec.describe Create, type: %i[model] do

        describe "validations" do
          subject { described_class.new(Txn.new) }
          it { is_expected.to validate_presence_of(:external_id) }
        end

      end
    end
  end
end
