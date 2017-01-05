class UpdateCellPhoneToStringOnUser < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :cell_phone_number, :string
  end
end
