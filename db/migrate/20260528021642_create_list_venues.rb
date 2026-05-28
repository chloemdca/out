class CreateListVenues < ActiveRecord::Migration[8.1]
  def change
    create_table :list_venues do |t|
      t.references :list, null: false, foreign_key: true
      t.references :venues, null: false, foreign_key: true

      t.timestamps
    end
  end
end
