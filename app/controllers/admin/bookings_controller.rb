# app/controllers/admin/bookings_controller.rb
module Admin
  class BookingsController < ApplicationController
    before_action :authenticate_admin
    before_action :set_booking, only: [:show, :destroy, :cancel]

    def show
      # Ensure @booking is set by set_booking before_action
    end

    def confirm
    @booking = Booking.find(params[:id])
    if @booking.update(status: 'confirmed')
      redirect_to admin_booking_path(@booking), notice: 'Booking successfully confirmed.'
    else
      redirect_to admin_booking_path(@booking), alert: 'Failed to confirm booking.'
    end
  end

    def cancel
      @booking.update(status: :cancelled)
      redirect_to admin_booking_path(@booking), notice: 'Booking cancelled successfully.'
    end

    private

    def set_booking
      @booking = Booking.find(params[:id])
    end
  end
end
