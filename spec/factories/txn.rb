FactoryGirl.define do

  factory :bloom_remit_txn, class: BloomRemit::Txn do
    association :recipient, factory: :bloom_remit_biller
    association :sender, factory: :bloom_remit_dummy_user
    amount 2500
    secret {"secret"}
  end

end
