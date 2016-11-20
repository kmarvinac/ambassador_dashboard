class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :school_name
      t.integer :total_enrollment
      t.string :state

      t.timestamps

    end
  end
end
