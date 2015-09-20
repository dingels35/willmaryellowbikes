class AddBikeCountToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :bike_count, :integer
  end
end
