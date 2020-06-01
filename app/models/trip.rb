class Trip < ApplicationRecord
  after_create :create_chatroom

# Attractions
  belongs_to :user
  has_many :trip_venues, dependent: :destroy
  has_many :venues, through: :trip_venues
  has_many :invitations
  has_many :users, through: :invitations
  has_one :chatroom


# Geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def create_chatroom
    self.chatroom = Chatroom.new
  end

end
