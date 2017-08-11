class AddAttsToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :name, :string
    add_column :students, :address, :text
    add_column :students, :phone, :text
  end
end
