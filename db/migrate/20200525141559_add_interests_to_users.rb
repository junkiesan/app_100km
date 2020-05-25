class AddInterestsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :interests, :string
  end
end
