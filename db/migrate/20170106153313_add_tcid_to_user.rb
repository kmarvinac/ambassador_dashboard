class AddTcidToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :tc_id, :integer
  end
end
