class RentalsController < ApplicationController
  def create
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    @park = Park.find(params[:park_id])
    @rental.park = @park
    if @rental.save!
      redirect_to park_path(@park)
    else
      #TODO render :new, status: :unprocessable_entity
    end
  end
end
