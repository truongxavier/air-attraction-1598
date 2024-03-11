class Park < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_many :park_reviews through :rentals
  has_many_attached :park_photos
  has_many_attached :chambers_photos
  has_many_attached :restaurants_photos

  validates :name, presence: true
  validates :price, presence: true
  validates :chambers_description, presence: true
  validates :restaurants_description, presence: true
  validates :park_description, presence: true
  validates :location, presence: true
end
