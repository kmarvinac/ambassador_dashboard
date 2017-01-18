class UpdateApproverUserColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :invoices, :approver_user_id
    add_column :invoices, :approver_name, :string
  end
end
