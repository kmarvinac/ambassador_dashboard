class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :requestor_user_id
      t.integer :approver_user_id
      t.integer :dollar_amount
      t.boolean :submitted
      t.datetime :submitted_on
      t.boolean :approved
      t.text :requestor_notes

      t.timestamps

    end
  end
end
