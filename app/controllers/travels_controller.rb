class TravelsController < ApplicationController
  authorize @travel

  def new
    @travel = Travel.new
  end
end
