class Bike < ActiveRecord::Base

  belongs_to :bike_rack
  has_many :statuses
  has_many :abandoned_statuses
  has_many :broken_statuses

  default_scope { where(destroyed_at: nil) }
  # scope :abandoned { where() }

  delegate :name, to: :bike_rack, prefix: true, allow_nil: true


  def broken?
    statuses.broken.unresolved.present?
  end

  def abandoned?
    statuses.abandoned.unresolved.present?
  end



end
