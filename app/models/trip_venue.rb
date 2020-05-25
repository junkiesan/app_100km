class TripVenue < ApplicationRecord
  belongs_to :trip
  belongs_to :venue
end
