class AddTripToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :trip, foreign_key: true
  end
end
