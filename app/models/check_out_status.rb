class CheckOutStatus < Status


  def to_string
    bike_rack_str = " at #{bike_rack.name} bike rack" if bike_rack
    bike_str = bike ? "Bike #{bike.identifier}" : "A bike"
    "#{bike_str} was checked out#{bike_rack_str}."
  end

end
