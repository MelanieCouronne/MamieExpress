class TravelsController < ApplicationController

  def new
    @travel = current_user.travels.new
    authorize @travel
  end
end
