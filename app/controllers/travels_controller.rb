class TravelsController < ApplicationController
  before_action :set_travel, only: [:show, :edit, :update, :destroy]

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
    if params[:departure].present? && params[:arrival].present? && params[:date].present? && params[:number].present?
      departure = policy_scope(Travel).search_by_departure(params[:departure])
      arrival = departure.search_by_arrival(params[:arrival])
      date = arrival.search_by_date(params[:date])
      @travels = date.search_by_number(params[:number])
    else
      @travels = policy_scope(Travel)
      # @travels = Travel.all
    end
  end

  def show
    @results = Geocoder.search(@travel.departure_location).first.coordinates
    @markers = [set_departure_marker, set_arrival_marker]
  end

  def destroy
    @travel.destroy

    redirect_to travels_path
  end

  def update
    @travel.status = true
    @travel.save

    redirect_to travels_path
  end

  private

  def set_travel
    @travel = Travel.find(params[:id])
    authorize @travel
  end

  def travel_params
    params.require(:travel).permit(:departure_location, :departure_date, :departure_hour, :arrival_location, :arrival_date, :number_passenger, :status)
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
