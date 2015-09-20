class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.string      :identifier,   nil: false
      t.string      :description
      t.integer     :bike_rack_id
      t.timestamp   :destroyed_at
      t.timestamps
    end
  end
end
