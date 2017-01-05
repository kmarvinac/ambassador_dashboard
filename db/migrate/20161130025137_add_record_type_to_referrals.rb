class AddRecordTypeToReferrals < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :record_type, :string
  end
end
