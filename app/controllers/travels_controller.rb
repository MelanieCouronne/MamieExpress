class TravelsController < ApplicationController

  def index
    @travels = policy_scope(Travel)
  end

  def show
    @travel = Travel.find(params[:id])
  end
end
