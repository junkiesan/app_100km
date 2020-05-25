class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :category
      t.string :address
      t.integer :zip
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
