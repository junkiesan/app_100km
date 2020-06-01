class DeleteMessageIdInChatrooms < ActiveRecord::Migration[6.0]
  def change
    remove_reference :chatrooms, :message
  end
end
