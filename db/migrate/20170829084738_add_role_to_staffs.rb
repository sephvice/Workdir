class AddRoleToStaffs < ActiveRecord::Migration[5.1]
  def change
    add_column :staffs, :role, :string
  end
end
