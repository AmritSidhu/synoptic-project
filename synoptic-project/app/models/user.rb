class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true
  validates :email, presence: true
  validates :employeeid, presence: true
  validates :mobile, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 4, maximum: 4 }
end
