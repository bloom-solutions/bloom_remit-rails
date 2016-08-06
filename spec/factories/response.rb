FactoryGirl.define do

  factory :response, parent: :bloom_remit_response do
    association :txn, factory: :txn
  end

end
