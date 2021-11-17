class TravelsController < ApplicationController
  before_action :set_travel, only: [:show, :edit]

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

  def edit
  end

  def index
    @travels = policy_scope(Travel)
  end

  def show
    @results = Geocoder.search(@travel.departure_location).first.coordinates
    @markers = [set_departure_marker, set_arrival_marker]
  end

  private

  def set_travel
    @travel = Travel.find(params[:id])
    authorize @travel
  end

  def travel_params
    params.require(:travel).permit(:departure_location, :departure_date, :departure_hour, :arrival_location, :arrival_date, :number_passenger)
  end

  def set_departure_marker
    {
      lat: @results.first,
      lng: @results.last,
      info_window: render_to_string(partial: "info_window", locals: { travel: @travel.departure_location })
      # image_url: helpers.asset_url('mamie_head.jpg')
    }
  end

  def set_arrival_marker
    {
      lat: @travel.arrival_latitude,
      lng: @travel.arrival_longitude,
      info_window: render_to_string(partial: "info_window", locals: { travel: @travel.arrival_location })
      # image_url: helpers.asset_url('mamie_head.jpg')
    }
  end
end
