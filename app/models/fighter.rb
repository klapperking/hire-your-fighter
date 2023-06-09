class Fighter < ApplicationRecord
  belongs_to :user
  has_many :users, through: :bookings
  has_one_attached :photo
  has_many :bookings

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
  validates :rating, presence: true, inclusion: { in: TIERS.keys.map(&:to_s) }

  validates :strength, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :defense, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  validates :max_stat, presence: true, numericality: { only_integer: true }
  validate :validate_max_stat # additional validation for sum of all stats equaling the rolled number

  include PgSearch::Model

  pg_search_scope :search_by_name_description_and_rating,
    against: [ :name, :description, :rating ],
    using: {
      tsearch: { prefix: true }
    }

  private

  def validate_max_stat
    stats = [strength, defense, speed]
    stats.each do |stat|
      errors.add(:max_stat, "You are allocating too many stat points") if stat > max_stat
    end
  end
end
