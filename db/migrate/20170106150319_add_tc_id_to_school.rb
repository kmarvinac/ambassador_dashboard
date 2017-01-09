class AddTcIdToSchool < ActiveRecord::Migration[5.0]
  def change
    add_column :schools, :tc_id, :integer
  end
end
