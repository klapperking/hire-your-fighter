class Fighter < ApplicationRecord
  belongs_to :user
  has_many :users, through: :bookings
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 20 }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :strength, presence: true, numericality: { only_integer: true }
  validates :defense, presence: true, numericality: { only_integer: true }
end
