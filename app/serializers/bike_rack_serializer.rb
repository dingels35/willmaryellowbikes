class BikeRackSerializer < ActiveModel::Serializer

  attributes :id, :name, :latitude, :longitude, :bike_count

end
