class Park < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_many :park_reviews through :rentals
end
