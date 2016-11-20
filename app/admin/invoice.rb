ActiveAdmin.register Invoice do

 permit_params :requestor_user_id, :approver_user_id, :dollar_amount, :submitted, :submitted_on, :approved, :requestor_notes

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
