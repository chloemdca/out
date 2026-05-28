class Log < ApplicationRecord
  belongs_to :user
  belongs_to :venue

  validates :rating, presence: true, inclusion: { in: 0..5 }
  validates :venue, presence: true
  # has_one_attached :file
end
