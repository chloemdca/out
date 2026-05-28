class Venue < ApplicationRecord
  CATEGORIES = ["bar", "restaurant", "cafe"]

  has_many :lists, dependent: :destroy
  has_many :logs, dependent: :destroy
  # has_one_attached :file

  reverse_geocoded_by :lat, :lng
end
