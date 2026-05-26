class List < ApplicationRecord
  belongs_to :user
  belongs_to :venue

  validates :name, presence: true
end
