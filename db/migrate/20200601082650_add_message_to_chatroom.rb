class AddMessageToChatroom < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :message, null: false, foreign_key: true
  end
end
