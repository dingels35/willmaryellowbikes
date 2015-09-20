class Status < ActiveRecord::Base

  belongs_to :bike_rack
  belongs_to :bike

  scope :abandoned, -> { where(type: 'AbandonedStatus') }
  scope :broken, -> { where(type: 'BrokenStatus') }
  scope :unresolved, -> { where(resolved: false) }

  delegate :name, to: :bike_rack, prefix: true, allow_nil: true
  delegate :identifier, to: :bike, prefix: true, allow_nil: true

  validates :type, presence: true

  reverse_geocoded_by :latitude, :longitude

  before_create :get_location_from_bike_rack

  private

  def get_location_from_bike_rack
    if bike_rack.present?
      self.latitude = bike_rack.latitude
      self.longitude = bike_rack.longitude
    end
  end

end
