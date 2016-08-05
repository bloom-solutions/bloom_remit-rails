FactoryGirl.define do

  factory :bloom_remit_txn, class: BloomRemit::Txn do
    target_slug "TARGET_SLUG"
    amount 2500
    secret { SecureRandom.uuid }
  end

end
