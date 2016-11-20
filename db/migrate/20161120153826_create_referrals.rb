class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.integer :referrer_id
      t.integer :school_id

      t.timestamps

    end
  end
end
