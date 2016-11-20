class AddReferralCountToSchools < ActiveRecord::Migration[5.0]
  def change
    add_column :schools, :referrals_count, :integer
  end
end
