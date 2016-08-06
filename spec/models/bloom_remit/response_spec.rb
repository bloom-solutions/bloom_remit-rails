require 'rails_helper'

module BloomRemit
  RSpec.describe Response do

    describe "associations" do
      it { is_expected.to belong_to(:txn).class_name(Txn.name) }
    end

    describe "validations" do
      it { is_expected.to validate_presence_of(:body) }
    end

  end
end
