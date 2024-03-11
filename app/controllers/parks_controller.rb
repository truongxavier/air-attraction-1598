class ParksController < ApplicationController
  before_action :set_park, only: %i[show destroy edit update]
  def index
    @parks = Park.all
  end

  def show; end

  def new
    @park = Park.new
  end

  def create
    @park = Park.new(park_params)
    @park.user = current_user
    if @park.save!
      redirect_to park_path(@park)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @park.destroy
    redirect_to, parks_path
  end

  def edit; end

  def update
    if @park.update(park_params)
      redirect_to park_path(@park)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def park_params
    params.require(:park).permit(:price, :chambers_description, :restaurants_description, :park_description, :user_id, :location, :name, park_photos: [], chambers_photos: [], restaurants_photos: [])
  end

  def set_park
    @park = Park.find(params[:id])
  end
end
