class AddGeoDataToTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :address, :string
    add_column :trips, :latitude, :float
    add_column :trips, :longitude, :float
    add_column :trips, :radius, :integer
  end
end
