# app/controllers/admin/bookings_controller.rb
module Admin
  class BookingsController < ApplicationController
    before_action :authenticate_admin
    before_action :set_booking, only: [:show, :destroy, :cancel]

    def show
      # Ensure @booking is set by set_booking before_action
    end

    def cancel
      @booking = Booking.find(params[:id])
      if @booking.update(status: 'cancelled')
        redirect_to admin_booking_path(@booking), notice: 'Booking successfully cancelled.'
      else
        redirect_to admin_booking_path(@booking), alert: 'Failed to cancel booking.'
      end
    end

    private

    def set_booking
      @booking = Booking.find(params[:id])
    end
  end
end
