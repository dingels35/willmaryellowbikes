class BikesController < ApplicationController
  respond_to :json

  def index
    respond_with(Bike.all)
  end

  def show
    respond_with(Bike.find(params[:id]))
  end

end
