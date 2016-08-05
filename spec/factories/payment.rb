FactoryGirl.define do

  factory :bloom_remit_dummy_payment, class: Payment do

  end

  factory(:bloom_remit_dummy_sub_payment, {
    class: SubPayment,
    parent: :bloom_remit_dummy_payment,
  }) do

  end

end
