class TripVenue < ApplicationRecord
  # Attractions
  has_many :venues

  belongs_to :trip
end
