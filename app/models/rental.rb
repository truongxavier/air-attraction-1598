class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :park
  has_many :reviews
end
