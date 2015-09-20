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


end
