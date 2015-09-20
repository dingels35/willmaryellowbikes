class BikeRacksController < ApplicationController
  respond_to :json


  def index
    respond_with(BikeRack.all)
  end

  def show
    respond_with(BikeRack.find(params[:id]))
  end

end
