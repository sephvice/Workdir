ActiveAdmin.register Staff do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :staff, :staffs, :email, :password, :encrypted_password, :team_id, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :current_sign_in_ip, :last_sign_in_at, :last_sign_in_ip
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_admin_user
#   permitted
# end
  index do
    column :email
    column :team
    column :last_sign_in_at
    column :created_at
  end

    filter :email
    filter :current_sign_in_at
    filter :sign_in_count
    filter :created_at

  form title: 'Staff Information' do |f|
    f.inputs 'Details' do
      f.input :email
      f.input :password
      f.input :confirm_password
      f.input :team
    end
    f.actions
  end

end
