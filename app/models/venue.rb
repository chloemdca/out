class Venue < ApplicationRecord
  CATEGORIES = ["Bar", "Restaurant", "Cafe"]

  has_many :lists, dependent: :destroy
  has_many :logs, dependent: :destroy
  # has_one_attached :file
end
