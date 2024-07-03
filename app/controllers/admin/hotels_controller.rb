# app/controllers/admin/hotels_controller.rb
module Admin
  class HotelsController < ApplicationController
    before_action :authenticate_admin # Ensure admin authentication
    before_action :set_hotel, only: [:edit, :update, :destroy]

    def index
      @hotels = Hotel.all
    end

    def new
      @hotel = Hotel.new
      @hotel.room_types.build
    end

    def create
      @hotel = Hotel.new(hotel_params)
      if @hotel.save
        redirect_to admin_hotels_path, notice: 'Hotel listing was successfully created.'
      else
        render :new
      end
    end

    def edit
      @hotel = Hotel.find(params[:id])
    end

    def update
      if @hotel.update(hotel_params)
        redirect_to admin_hotels_path, notice: 'Hotel listing was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @hotel = Hotel.find(params[:id])
      if @hotel.destroy
        redirect_to admin_dashboard_path, notice: 'Hotel listing was successfully deleted.'
      else
        redirect_to admin_dashboard_path, alert: 'Failed to delete the hotel listing.'
      end
    end

    private

    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    def hotel_params
      params.require(:hotel).permit(:hotel_name, :description, :location, :contact_details, :amenities)
    end
  end
end
