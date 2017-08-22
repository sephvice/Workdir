class AddDepartmentToStaffs < ActiveRecord::Migration[5.1]
  def change
    add_column :staffs, :Department, :string
  end
end
