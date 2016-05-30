class BrokenStatus < Status

  def to_string
    bike_rack_str = " at #{bike_rack.name} bike rack" if bike_rack
    description_str = "The location was described as: #{location_description}." if location_description
    bike_str = bike ? "Bike #{bike.identifier}" : "A bike"
    "#{bike_str} was reported broken#{bike_rack_str}. #{description_str} Reported details: #{broken_description}"
  end

end
