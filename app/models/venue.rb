class Venue < ApplicationRecord
  # Attractions
  has_many :trip_venues

  #ActiveStorage
  has_one_attached :photo

end
