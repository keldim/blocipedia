FactoryGirl.define do
  factory :user do

    sequence(:email) { |n| "user_#{n}@factory.com" }
    password RandomData.random_sentence

  end
end
