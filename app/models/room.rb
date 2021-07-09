class Room < ApplicationRecord
  validates :name, presence: true
  validates :room_introduction, length: {maximum: 200}
  validates :fee, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates :address, presence: true
  validates :register_user_id, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
