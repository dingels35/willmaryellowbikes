class BikeRack < ActiveRecord::Base

  has_many :bikes
  has_many :statuses

end