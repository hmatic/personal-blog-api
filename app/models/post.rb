class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :tags
  has_many :comments

  enum status: [:draft, :published]

  validates :title, presence: true, length: { minimum: 5 }
  validates :content, presence: true, length: { minimum: 30 }
  
  validate :no_publish_date_on_draft

  private

  def no_publish_date_on_draft
    return if draft? && published_on.nil?
    return if published? && published_on.present?
    errors.add(:published_on, 'can not be present if status is draft')
  end
end
