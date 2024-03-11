class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :park
  has_many :reviews

  validates :arrival_date, presence: true
  validates :arrival_date, presence: true
  validates :visitor_number, presence: true
  
end
