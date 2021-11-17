class TravelsController < ApplicationController
  before_action :set_travel, only: :show

  def new
    @travel = current_user.travels.new
    authorize @travel
  end

  def create
    @travel = current_user.travels.new(travel_params)
    authorize @travel
    if @travel.valid?
      @travel.save
      redirect_to travel_path(@travel)
    else
      render :new
    end
  end

  def index
    @travels = policy_scope(Travel)
  end

  def show
    @travels = Travel.geocoded
    @markers = @travels.geocoded.map do |travel|
      {
        lat: travel.latitude,
        lng: travel.longitude,
        info_window: render_to_string(partial: "info_window", locals: { travel: travel }),
        # image_url: helpers.asset_url('mamie_head.jpg')
      }
    end
  end

  private

  def set_travel
    @travel = Travel.find(params[:id])
    authorize @travel
  end

  def travel_params
    params.require(:travel).permit(:departure_location, :departure_date, :departure_hour, :arrival_location, :arrival_date, :number_passenger)
  end
end
