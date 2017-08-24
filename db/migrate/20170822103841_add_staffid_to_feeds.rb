class AddStaffidToFeeds < ActiveRecord::Migration[5.1]
  def change
    add_column :feeds, :staff_id, :integer
  end
end
