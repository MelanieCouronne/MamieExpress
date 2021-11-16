class TravelsController < ApplicationController
  def new
    @travel = current_user.travels.new
    authorize @travel
  end

  def show
    @travel = Travel.find(params[:id])
  end
end
