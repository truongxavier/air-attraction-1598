class Park < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_many :park_reviews, through: :rentals, source: :park, :dependent => :destroy
  has_many_attached :park_photos
  has_many_attached :chambers_photos
  has_many_attached :restaurants_photos
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :name, presence: true
  validates :price, presence: true
  validates :chambers_description, presence: true
  validates :restaurants_description, presence: true
  validates :park_description, presence: true
  validates :location, presence: true
end
