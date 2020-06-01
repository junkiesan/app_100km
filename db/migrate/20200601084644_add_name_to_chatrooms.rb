class AddNameToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_column :chatrooms, :name, :string
  end
end
