class Hotel < ApplicationRecord
  has_many :room_types
  has_many :bookings
  has_many :reviews

  validates :hotel_name, presence: true
  validates :location, presence: true
  validates :contact_details, presence: true
end
