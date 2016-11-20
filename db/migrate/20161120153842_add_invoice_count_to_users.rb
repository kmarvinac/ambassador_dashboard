class AddInvoiceCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :invoices_count, :integer
  end
end
