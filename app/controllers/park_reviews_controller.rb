class ParkReviewsController < ApplicationController
  def new
    @park_review = ParkReview.new
  end

  def create
    @park_review = ParkReview.new(park_review_params)
    @rental = Rental.find(params[:rental_id])
    @park_review.rental = @rental
    if @park_review.save!
      redirect_to park_path(@rental.park)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def park_review_params
    params.require(:park_review).permit(:comment, :rating)
  end
end
