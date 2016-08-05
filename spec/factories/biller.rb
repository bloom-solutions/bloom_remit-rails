FactoryGirl.define do

  factory :bloom_remit_dummy_biller, class: Biller do
    sequence(:slug) {|n| "slug#{n}" }
  end

end
