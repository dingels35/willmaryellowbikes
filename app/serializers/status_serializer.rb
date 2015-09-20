class StatusSerializer < ActiveModel::Serializer

  # attributes :id, :identifier, :description, :bike_rack_name, :broken?, :abandoned?

  attributes :id, :type, :latitude, :longitude, :location_description, :resolved, :created_at,
    :bike_rack_name, :bike_identifier

end
