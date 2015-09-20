class BikeCountStatus < Status

  after_save :update_bike_rack

  private

  def update_bike_rack
    bike_rack.update_bike_count bike_count
  end

end
