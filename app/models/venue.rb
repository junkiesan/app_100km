class Venue < ApplicationRecord
  # Attractions
  belongs_to :trip_venue
end
