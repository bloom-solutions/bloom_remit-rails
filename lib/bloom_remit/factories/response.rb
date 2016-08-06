FactoryGirl.define do

  factory :bloom_remit_response, class: BloomRemit::Response do
    association :txn, factory: :bloom_remit_txn
  end

end
