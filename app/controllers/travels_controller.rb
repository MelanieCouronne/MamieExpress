class TravelsController < ApplicationController

  def new
    @travel = Travel.new
  end
end
