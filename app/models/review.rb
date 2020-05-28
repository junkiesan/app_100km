class Review < ApplicationRecord

# Attractions
  belongs_to :venue
  belongs_to :user

# Validations
  validates :comment, :rating, presence: true
  validates :rating, inclusion: { in: 0..5 }, numericality: { only_integer: true }

#ActiveStorage
  has_many_attached :photos
end
