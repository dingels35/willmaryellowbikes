class AddBikeCountAtToBikeRacks < ActiveRecord::Migration
  def change
    add_column :bike_racks, :bike_count_at, :timestamp
  end
end
