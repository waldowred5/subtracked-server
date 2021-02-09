FactoryBot.define do
  factory :user do
    sequence :first_name do |n|
      "name#{n}"
    end
    sequence :email do |n|
      "email#{n}@testing123.com"
    end
    sequence :password do |n|
      "password#{n}"
    end
    sequence :password_confirmation do |n|
      "password#{n}"
    end

    trait :invalid do 
      email {nil}
    end

    factory :user_with_subscriptions do
      transient do
        subscriptions_count { 5 }
      end
      after(:create) do |user, evaluator|
        create_list(:subscription, evaluator.subscriptions_count, user: user)
        user.reload
      end
    end
  end

  factory :subscription do
    # id {666}
    name {"Spotify"}
    logo_image {"spotify.com"}
    amount {24}
    description {'Music streaming service'}
    association :user

    trait :invalid do 
      name {nil}
    end
  end
end