class AddLatLongToCab < ActiveRecord::Migration[5.0]
  def change
    add_column :cabs, :latitude, :decimal
    add_column :cabs, :longitude, :decimal
    add_column :cabs, :service_area, :string
  end
end
