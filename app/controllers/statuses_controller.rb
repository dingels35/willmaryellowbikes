class StatusesController < ApplicationController
  respond_to :json
  before_filter :load_statuses, except: :create

  def index
    @statuses = @statuses.apply_scopes(params[:scope]) if params[:scope]
    respond_with(@statuses)
  end

  def show
    respond_with(@statuses.find(params[:id]))
  end

  def create
    status = Status.new(permitted_params)
    if status.save
      render json: status, status: :created
    else
      render json: {errors: status.errors} , status: :unprocessable_entity
    end
  end

  private

  def load_statuses
    @statuses = Status
    @statuses = Bike.find(params[:bike_id]).statuses if params[:bike_id]
    @statuses = BikeRack.find(params[:bike_rack_id]).statuses if params[:bike_rack_id]
  end

  def permitted_params
    params.fetch(:status, {}).permit(
      :bike_id, :bike_rack_id, :latitude, :longitude, :location_description, :type
    )
  end


end
