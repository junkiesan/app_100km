class RemoveInterestsFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :interests, :string
  end
end
