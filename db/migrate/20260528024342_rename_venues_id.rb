class RenameVenuesId < ActiveRecord::Migration[8.1]
  def change
    rename_column :list_venues, :venues_id, :venue_id
  end
end
