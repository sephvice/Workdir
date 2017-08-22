class AddContentToStaffs < ActiveRecord::Migration[5.1]
  def change
    add_column :staffs, :content, :string
  end
end
