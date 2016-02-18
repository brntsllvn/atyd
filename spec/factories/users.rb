FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| 'FuzzyDuck#{n}@aol.com' }
  end
end