class BikeSerializer < ActiveModel::Serializer

  attributes :id, :identifier, :description, :bike_rack_name, :broken?, :abandoned?

end
