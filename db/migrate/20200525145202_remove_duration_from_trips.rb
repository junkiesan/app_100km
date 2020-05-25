class RemoveDurationFromTrips < ActiveRecord::Migration[6.0]
  def change
    remove_column :trips, :duration, :string
  end
end
