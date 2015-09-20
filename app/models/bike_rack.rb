class BikeRack < ActiveRecord::Base

  has_many :bikes
  has_many :statuses
  has_many :bike_count_statuses

  reverse_geocoded_by :latitude, :longitude

  def update_bike_count(ct)
    self.bike_count = ct
    self.bike_count_at = Time.now
    self.save
  end

end
