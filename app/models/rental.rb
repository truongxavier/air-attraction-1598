class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :park
  has_many :park_reviews, :dependent => :destroy

  validates :arrival_date, presence: true
  validates :departure_date, presence: true
  validates :visitors_number, presence: true
end
