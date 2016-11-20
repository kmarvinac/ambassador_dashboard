class AddReferralCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :referrals_count, :integer
  end
end
