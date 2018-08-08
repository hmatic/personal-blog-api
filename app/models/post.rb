class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :tags

  enum status: [:draft, :published]

  validates :title, presence: true, length: { minimum: 5 }
  validates :content, presence: true, length: { minimum: 30 }
end