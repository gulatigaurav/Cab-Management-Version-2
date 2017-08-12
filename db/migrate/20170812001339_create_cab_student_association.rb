class CreateCabStudentAssociation < ActiveRecord::Migration[5.0]
  def change
    create_table :cab_students do |t|
      t.references :cab, foreign_key: true
      t.references :student, foreign_key: true
    end
  end
end
