class BikeCountStatus < Status

  after_save :update_bike_rack


  def to_string
    "There are #{bike_count} bikes at #{bike_rack.name} bike rack."
  end

  private

  def update_bike_rack
    bike_rack.update_bike_count bike_count
  end

end
