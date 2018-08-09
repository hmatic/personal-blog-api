class User < ApplicationRecord
  has_secure_password
  has_secure_token

  has_many :posts, dependent: :destroy

  enum role: [:user, :moderator, :admin]

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :password, presence: true, length: { minimum: 8, maximum: 30 }

  scope :ordered, -> { order('role DESC, email ASC') }
end
