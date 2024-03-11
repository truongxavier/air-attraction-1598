class ParkReview < ApplicationRecord
  belongs_to :rental
  belongs_to :user through :rental
end
