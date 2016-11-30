class AddColumnsToReferrals < ActiveRecord::Migration[5.0]
  def change
    add_column :referrals, :invited_user_email, :string
    add_column :referrals, :record_type, :string
    add_column :referrals, :accepted_at, :datetime
  end
end
