class List < ApplicationRecord
  belongs_to :user

  has_many :list_venues, dependent: :destroy
  has_many :venues, through: :list_venues

  validates :name, presence: true
end
