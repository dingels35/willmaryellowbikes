class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string        :type,     nil: false
      t.integer       :bike_id
      t.integer       :bike_rack_id
      t.float         :latitude
      t.float         :longitude
      t.string        :location_description
      t.boolean       :resolved
      t.timestamps
    end
  end
end
