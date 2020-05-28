class Venue < ApplicationRecord
  # Geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # Attractions
  has_many :trip_venues, dependent: :destroy
  has_many :reviews

  #ActiveStorage
  has_many_attached :photos

end
