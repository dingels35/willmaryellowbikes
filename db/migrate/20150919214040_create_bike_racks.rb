class CreateBikeRacks < ActiveRecord::Migration
  def change
    create_table :bike_racks do |t|
      t.string      :name,          nil: false
      t.float       :latitude,      nil: false
      t.float       :longitude,     nil: false
      t.integer     :bike_count
      t.timestamp   :destroyed_at
      t.timestamps
    end
  end
end
