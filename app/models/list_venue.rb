class ListVenue < ApplicationRecord
  belongs_to :list
  belongs_to :venue

  validates :venue_id, uniqueness: { scope: :list_id }
end
