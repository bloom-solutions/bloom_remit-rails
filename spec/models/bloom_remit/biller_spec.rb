require 'rails_helper'

module BloomRemit
  RSpec.describe Biller do

    describe "attributes" do
      it { is_expected.to have_attribute(:first_field, String) }
      it { is_expected.to have_attribute(:first_field_format, String) }
      it { is_expected.to have_attribute(:first_field_width, Integer) }

      it { is_expected.to have_attribute(:second_field, String) }
      it { is_expected.to have_attribute(:second_field_format, String) }
      it { is_expected.to have_attribute(:second_field_width, Integer) }
    end

    describe ".active" do
      let!(:biller_1) { create(:bloom_remit_biller, deactivated_at: nil) }
      let!(:biller_2) do
        create(:bloom_remit_biller, deactivated_at: 2.minutes.ago)
      end
      let!(:biller_3) { create(:bloom_remit_biller, deactivated_at: nil) }

      it "returns billers that have not been deactivated" do
        expect(Biller.active).to match_array([biller_1, biller_3])
      end
    end

    describe "#active?" do
      subject { biller.active? }

      context "not deactivated" do
        let(:biller) { build_stubbed(:bloom_remit_biller, deactivated_at: nil) }
        it { is_expected.to be true }
      end

      context "deactivated in the past" do
        let(:biller) do
          build_stubbed(:bloom_remit_biller, deactivated_at: 2.minutes.ago)
        end
        it { is_expected.to be false }
      end
    end

  end
end
