class ParkReview < ApplicationRecord
  belongs_to :rental

  validates :comment, presence: true
  validates :rating, presence: true, numericality: { in: 0..5 }
end
