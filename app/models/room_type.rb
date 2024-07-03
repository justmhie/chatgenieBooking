class RoomType < ApplicationRecord
  belongs_to :hotel
  has_many :bookings

  validates :name, presence: true
  validates :capacity, presence: true
  validates :price_per_night, presence: true, numericality: { greater_than: 0 }
end
