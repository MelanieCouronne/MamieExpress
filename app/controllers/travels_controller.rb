class TravelsController < ApplicationController
  def new
    @travel = current_user.travels.new
    authorize @travel
  end

  def create
    @travel = Travel.new(travel_params)
    if travel.valid?
      @travel.save
      redirect_to travel_path(@travel)
    else
      render :new
    end
  end

  def show
    @travel = Travel.find(params[:id])
  end

  private

  def travel_params
    params.require(:travel).permit(:departure_location, :departure_date, :arrival_location, :arrival_date, :number_passenger)
  end
end
