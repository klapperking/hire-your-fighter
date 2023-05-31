class Fighter < ApplicationRecord
  belongs_to :user
  has_many :users, through: :bookings
  has_one_attached :photo

  # fighter tiers ; tier => max stat num
  TIERS = {
    Standard: [1, 24],
    Premium: [25, 54],
    Epic: [50, 74],
    Legendary: [75, 99]
  }

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :rating, presence: true, inclusion: { in: TIERS.keys.map { |key| key.to_s} }

  validates :strength, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :defense, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  validates :stat_sum, presence: true, numericality: { only_integer: true }
  validate :validate_stat_sum # additional validation for sum of all stats equaling the rolled number

  private

  def validate_stat_sum
    stat_sum >= strength + defense
  end
end
