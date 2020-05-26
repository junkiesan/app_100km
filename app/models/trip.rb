class Trip < ApplicationRecord

# Attractions
  belongs_to :user
  has_many :trip_venues, dependent: :destroy
  has_many :venues, through: :trip_venues


# Geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
