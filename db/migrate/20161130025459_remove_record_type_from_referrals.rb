class RemoveRecordTypeFromReferrals < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :record_type, :string
  end
end
