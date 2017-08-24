class CreateStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :staffs do |t|
      t.integer :team_id
      t.timestamps
    end
  end
end
