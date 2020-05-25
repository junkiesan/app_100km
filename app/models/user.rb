class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # Attractions
  has_many :trips

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
