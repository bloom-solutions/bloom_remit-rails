FactoryGirl.define do

  factory :txn, parent: :bloom_remit_txn, class: BloomRemit::Txn do
    association :owner, factory: :bloom_remit_dummy_payment
    association :sender, factory: :bloom_remit_dummy_user
  end

end
