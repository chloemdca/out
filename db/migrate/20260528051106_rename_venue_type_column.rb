class RenameVenueTypeColumn < ActiveRecord::Migration[8.1]
  def change
    rename_column :venues, :type, :venue_type
  end
end
