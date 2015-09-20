class BikesController < ApplicationController
  respond_to :json

  def index
    bikes = Bike.all
    bikes = bikes.apply_scope(params[:scope]) if params[:scope]
    respond_with(bikes)
  end

  def show
    respond_with(Bike.find(params[:id]))
  end

end
