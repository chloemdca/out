class AddLatLngtoVenues < ActiveRecord::Migration[8.1]
  def change
    add_column :venues, :lat, :float
    add_column :venues, :lng, :float
  end
end
