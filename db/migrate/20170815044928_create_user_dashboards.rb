class CreateUserDashboards < ActiveRecord::Migration[5.1]
  def change
    create_table :user_dashboards do |t|

      t.timestamps
    end
  end
end
