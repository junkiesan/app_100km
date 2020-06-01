class TripVenue < ApplicationRecord
	attr_accessor :query

  belongs_to :trip
  belongs_to :venue
end
