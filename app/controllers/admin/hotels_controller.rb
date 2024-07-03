# app/controllers/admin/hotels_controller.rb
module Admin
  class HotelsController < ApplicationController
    before_action :authenticate_admin # Ensure admin authentication
    before_action :set_hotel, only: [:show, :edit, :update, :destroy]

    def index
      @hotels = Hotel.all
    end

    def new
      @hotel = Hotel.new
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
    end

    def update
      if @hotel.update(hotel_params)
        redirect_to admin_hotels_path, notice: 'Hotel listing was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @hotel.destroy
      redirect_to admin_hotels_path, notice: 'Hotel listing was successfully deleted.'
    end

    private

    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    def hotel_params
      params.require(:hotel).permit(:hotel_name, :description, :location, :contact_details, :amenities, :photo_gallery)
    end
  end
end
