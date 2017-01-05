class RemoveInvitedUserEmailFromReferrals < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :invited_user_email, :string
  end
end
