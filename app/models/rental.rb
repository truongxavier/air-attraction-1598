class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :park
  has_many :reviews

  validates :arrival_date, presence: true
  validates :arrival_date, presence: true
  validates :visitors_number, presence: true
end
