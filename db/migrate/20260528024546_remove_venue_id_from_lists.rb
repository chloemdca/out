class RemoveVenueIdFromLists < ActiveRecord::Migration[8.1]
  def change
    remove_reference :lists, :venue, foreign_key: true
  end
end
