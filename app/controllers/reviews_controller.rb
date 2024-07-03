class ReviewsController < ApplicationController
  before_action :require_user

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to hotel_path(@review.hotel)
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :hotel_id, :rating, :comment, :date)
  end
end
