class Hotel < ApplicationRecord
  has_many :room_types, dependent: :destroy
  accepts_nested_attributes_for :room_types, allow_destroy: true
  
  has_many :bookings
  has_many :reviews

  validates :hotel_name, presence: true
  validates :location, presence: true
  validates :contact_details, presence: true

  #has_one_attached :photo_gallery
end
