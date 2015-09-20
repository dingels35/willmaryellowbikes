class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string        :type,                  null: false
      t.integer       :bike_id
      t.integer       :bike_rack_id
      t.float         :latitude
      t.float         :longitude
      t.text          :location_description
      t.text          :broken_description
      t.boolean       :resolved
      t.timestamps
    end
  end
end
