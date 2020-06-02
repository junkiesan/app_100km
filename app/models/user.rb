class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # Attractions
  has_many :trips, dependent: :destroy
  has_many :invitations

  # ActiveStorage
  has_one_attached :photo

  # Validates
  validates :interests, inclusion: { in: ['Sportif', 'Farniente', 'Vélo', 'Culture', 'Nature'] }


  # Devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Variable interests
  INTERESTS = ['Sportif', 'Farniente', 'Vélo', 'Culture', 'Nature']
end
