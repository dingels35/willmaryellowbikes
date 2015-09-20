class BikeRack < ActiveRecord::Base

  has_many :bikes
  has_many :statuses

  reverse_geocoded_by :latitude, :longitude

end
