FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "category-#{n}" }
    description 'Category desc'
  end
end
