class AddUserIdToCabs < ActiveRecord::Migration[5.0]
  def change
    add_column :cabs, :user_id, :integer
  end
end
