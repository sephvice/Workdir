class AddAvatarToStaffs < ActiveRecord::Migration[5.1]
  def change
    add_column :staffs, :avatar, :string
  end
end
