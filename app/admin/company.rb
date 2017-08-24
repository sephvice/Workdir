ActiveAdmin.register Company do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes, :name]
#   permitted << :other if params[:action] == 'create' && current_admin_user
#   permitted
# end

index do
  selectable_column
  id_column
  column :name
  column :created_at
  actions
end
end
