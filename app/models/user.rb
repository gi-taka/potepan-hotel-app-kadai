class User < ApplicationRecord
  validates :name, presence: true
  validates :mail, presence: true
  validates :password, presence: true, length: {minimum: 8}, confirmation: true
  validates :password_confirmation, presence: true
end
