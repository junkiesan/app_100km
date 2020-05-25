class Trip < ApplicationRecord

  # Attractions
  belongs_to :user
  has_many :trip_venues


# Validations

end
