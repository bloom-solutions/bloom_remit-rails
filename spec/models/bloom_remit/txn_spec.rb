require 'rails_helper'

module BloomRemit
  RSpec.describe Txn, type: %i[model] do

    describe "associations" do
      it { is_expected.to belong_to(:sender) }
      it { is_expected.to belong_to(:owner) }
    end

  end
end
