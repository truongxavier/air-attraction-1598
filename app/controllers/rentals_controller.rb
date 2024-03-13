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

  def accept
    @rental = Rental.find(params[:id])
    @rental.validated = true
  end

  def decline
    @rental = Rental.find(params[:id])
    @rental.validated = false
  end

  private

  def rental_params
    params.require(:rental).permit(:arrival_date, :departure_date, :visitors_number)
  end
end
