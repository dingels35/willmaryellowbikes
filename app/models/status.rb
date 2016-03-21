class Status < ActiveRecord::Base

  belongs_to :bike_rack
  belongs_to :bike

  scope :abandoned, -> { where(type: 'AbandonedStatus') }
  scope :broken, -> { where(type: 'BrokenStatus') }
  scope :bike_count, -> { where(type: 'BikeCountStatus') }
  scope :unresolved, -> { where(resolved: false) }
  FILTERABLE_SCOPES = %w{ abandoned broken bike_count unresolved }


  delegate :name, to: :bike_rack, prefix: true, allow_nil: true
  delegate :identifier, to: :bike, prefix: true, allow_nil: true

  validates :type, presence: true

  reverse_geocoded_by :latitude, :longitude

  # before_create :get_location_from_bike_rack

  def self.apply_scope(scope)
    return none unless FILTERABLE_SCOPES.include?(scope)
    send(scope)
  end

  private

  def get_location_from_bike_rack
    if bike_rack.present?
      self.latitude = bike_rack.latitude
      self.longitude = bike_rack.longitude
    end
  end

end
