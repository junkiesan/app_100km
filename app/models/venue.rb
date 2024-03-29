class Venue < ApplicationRecord
  # Geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # Attractions
  has_many :trip_venues, dependent: :destroy
  has_many :reviews

  #ActiveStorage
  has_many_attached :photos

  # scope :reviewed, -> { where(reviews) }

  # call .reviewed(x) on Venue model to get the first x reviewed venues
  def self.reviewed(num = 3)
    Venue.all.select { |v| v.reviews.any? }.first(num)
  end

  include PgSearch::Model
  pg_search_scope :search_by_category,
    against: [ :category ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
