module Admin
  class DashboardController < ApplicationController
    before_action :require_admin

    def index
      @hotels = Hotel.all
      @bookings = Booking.all
      @users = User.all
    end
  end
end
