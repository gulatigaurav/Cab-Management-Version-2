class AddPlacesToCabs < ActiveRecord::Migration[5.0]
  def change
    add_column :cabs, :source , :string
    add_column :cabs, :destination, :string , :deafult => "NCU GURGAON"
    add_column :cabs, :via, :string
    end
  end
