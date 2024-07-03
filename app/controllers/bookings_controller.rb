class BookingsController < ApplicationController
  before_action :set_hotel, only: [:new, :create]
  
  def index
    @bookings = Booking.all
  end
  
  def new
    @booking = Booking.new
  end

  def create
    @booking = current_user.bookings.new(booking_params)
    @booking.hotel = @hotel

    if @booking.save
      redirect_to booking_path(@booking), notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end


  private

  def set_hotel
    @hotel = Hotel.find(params[:hotel_id])
  end

  def booking_params
    params.require(:booking).permit(:check_in_date, :check_out_date, :room_type_id, :status)
  end
end
