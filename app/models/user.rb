
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :credit, numericality: { only_integer: true }
  has_many :fighters
  has_many :booked_fighters, through: :bookings, source: :fighters
  has_many :bookings
  has_many :recorded_bookings, through: :fighters, source: :bookings
end
