
class User < ApplicationRecord
  MAX_FIGHTERS = 5

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :fighters
  has_many :booked_fighters, through: :bookings, source: :fighters
  has_many :bookings
  has_many :recorded_bookings, through: :fighters, source: :bookings

  validates :first_name, presence: true
  validates :credit, numericality: { only_integer: true }
  validates :last_name, presence: true
  validate :number_of_fighters

  private

  def number_of_fighters
    errors.add(:fighters, 'Can not have more fighters per user') unless fighters.count < MAX_FIGHTERS
  end
end
