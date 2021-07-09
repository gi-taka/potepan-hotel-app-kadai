class User < ApplicationRecord
  has_secure_password
  validates :name, uniqueness: true, presence: true
  validates :mail, uniqueness: true, presence: true
  validates :password, presence: true, length: {minimum: 8}, confirmation: true
  validates :password_confirmation, presence: true

  mount_uploader :image, ImageUploader
end
