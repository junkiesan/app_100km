class Venue < ApplicationRecord
  # Attractions
  has_many :trip_venues
end
