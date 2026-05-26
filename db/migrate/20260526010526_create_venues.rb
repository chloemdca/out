class CreateVenues < ActiveRecord::Migration[8.1]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :category
      t.string :type

      t.timestamps
    end
  end
end
