class Log < ApplicationRecord
  belongs_to :user
  belongs_to :venue

  validates :rating, presence: true, inclusion: { in: 0..5 }
  # has_one_attached :file
end
