class Bike < ActiveRecord::Base

  belongs_to :bike_rack
  has_many :statuses
  has_many :abandoned_statuses
  has_many :broken_statuses

  default_scope { where(destroyed_at: nil) }
  scope :abandoned, -> { where(:id => AbandonedStatus.unresolved.pluck(:bike_id).uniq) }
  scope :broken, -> { where(:id => BrokenStatus.unresolved.pluck(:bike_id).uniq) }
  scope :abandoned_or_broken, -> { where(:id => (BrokenStatus.unresolved.pluck(:bike_id) + AbandonedStatus.unresolved).pluck(:bike_id).uniq) }
  scope :abandoned_or_broken, -> { where(:id => (BrokenStatus.unresolved.pluck(:bike_id) + AbandonedStatus.unresolved).uniq) }

  delegate :name, to: :bike_rack, prefix: true, allow_nil: true

  def self.apply_scope(scope)
    return none unless %i(abandoned broken abandoned_or_broken).include?(scope.to_sym)
    send(scope)
  end

  def broken?
    statuses.broken.unresolved.present?
  end

  def abandoned?
    statuses.abandoned.unresolved.present?
  end



end
