FactoryGirl.define do

  factory :bloom_remit_dummy_user, class: User do

  end

  factory(:bloom_remit_dummy_sub_user, {
    class: SubUser,
    parent: :bloom_remit_dummy_user,
  }) do

  end

end
