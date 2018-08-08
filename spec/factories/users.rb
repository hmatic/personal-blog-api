FactoryBot.define do
  factory :user do
    first_name 'Hrvoje'
    last_name 'Matic'
    sequence(:email) { |n| "user-#{n}@email.com" }
    role :user
    password 'password'
  end
end
