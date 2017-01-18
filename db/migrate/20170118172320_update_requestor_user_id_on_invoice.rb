class UpdateRequestorUserIdOnInvoice < ActiveRecord::Migration[5.0]
  def change
    rename_column :invoices, :requestor_user_id, :user_id
  end
end
