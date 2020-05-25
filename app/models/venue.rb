class Venue < ApplicationRecord
  # Attractions
  has_many :trip_venue
end
