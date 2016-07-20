FactoryGirl.define do

  factory :bloom_remit_biller, class: BloomRemit::Biller do
    sequence(:slug) {|n| "slug#{n}" }
  end

end
