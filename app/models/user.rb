class User < ApplicationRecord

  has_secure_password
  has_many :bookings, dependent: :destroy

  def name
    "#{first_name} #{last_name}"
  end
  
  def editor? 
    self.role == 'editor' 
  end

  def admin?
    self.role == 'admin'
  end

end
