class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  belongs_to :room_type

  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
  validate :check_dates

  enum status: { pending: 0, confirmed: 1, cancelled: 2 }
  
  private
  def set_default_status
    self.status ||= :pending
  end
  
  def check_dates
      if check_in_date.present? && check_out_date.present? && check_in_date >= check_out_date
        errors.add(:check_out_date, "must be after the check-in date")
    end
  end
end
