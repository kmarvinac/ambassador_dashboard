class AddInvitedUserEmailToReferrals < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :invited_user_email, :string
  end
end
