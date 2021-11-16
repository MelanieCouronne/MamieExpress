class TravelsController < ApplicationController

  def show
    @travel = Travel.find(params[:id])
  end
end
