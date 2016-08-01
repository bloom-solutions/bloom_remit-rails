require 'rails_helper'

module BloomRemit
  RSpec.describe Txn, type: %i[model] do

    describe "associations" do
      it { is_expected.to belong_to(:recipient) }
      it { is_expected.to belong_to(:sender) }
    end

  end
end
