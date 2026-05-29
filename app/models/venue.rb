class Venue < ApplicationRecord
  CATEGORIES = ["Bar", "Restaurant", "Cafe"]

  has_many :list_venues, dependent: :destroy
  has_many :lists, through: :list_venues
  has_many :logs, dependent: :destroy
  # has_one_attached :file

  reverse_geocoded_by :lat, :lng

  def average_rating
    logs.average(:rating)&.round(1)
  end
end
