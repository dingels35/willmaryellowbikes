class BikeRacksController < ApplicationController
  respond_to :json


  def index
    respond_with(BikeRack.all)
  end

  def show
    respond_with(BikeRack.find(params[:id]))
  end

  def closest
    params[:lat] ||= 0
    params[:long] ||= 0
    respond_with(BikeRack.near([params[:lat],params[:long]],20).first)
  end

end
