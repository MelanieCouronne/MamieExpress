class TravelsController < ApplicationController
  before_action :set_travel, only: :show

  def show
  end

  private

  def set_travel
    @travel = Travel.find(params[:id])
    authorize @travel
  end
end
