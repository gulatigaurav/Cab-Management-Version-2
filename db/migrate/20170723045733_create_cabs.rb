class CreateCabs < ActiveRecord::Migration[5.0]
  def change
    create_table :cabs do |t|
      t.string :name
      t.integer :reg_no
      t.integer :seats
      t.boolean :aircond
      t.float :monthly_rental
      t.timestamps
    end
  end
end
