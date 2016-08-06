require 'rails_helper'

module BloomRemit
  RSpec.describe Txn, type: %i[model] do

    describe "associations" do
      it { is_expected.to belong_to(:sender) }
      it { is_expected.to belong_to(:owner) }
      it do
        is_expected.to have_many(:responses).class_name(Response.name).
          dependent(:destroy)
      end
    end

  end
end
