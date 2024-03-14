class ParksController < ApplicationController
  before_action :set_park, only: %i[show destroy edit update]
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @parks = Park.all
    if params[:query].present?
      @parks = @parks.where("name ILIKE ?", "%#{params[:query]}%")
    end
    @markers = @parks.geocoded.map do |park|
      {
        lat: park.latitude,
        lng: park.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { park: park }),
        marker_html: render_to_string(partial: "marker", locals: { park: park })
      }
    end
  end

  def show
    @rental = Rental.new
    @park_review = ParkReview.new
  end

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
    redirect_to dashboard_path
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
