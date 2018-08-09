FactoryBot.define do
  factory :post do
    title 'Post title'
    content 'Post content must be at least 30 characters long'
    status :draft
    user
    category
    tags { create_list(:tag, 3) }
  end
end
