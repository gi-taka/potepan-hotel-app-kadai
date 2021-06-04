class User < ApplicationRecord
  validates :name, presence: true
  validates :mail, presence: true
  validates :password, presence: true, length: {minimum: 8}
end
