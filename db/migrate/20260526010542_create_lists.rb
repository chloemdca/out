class CreateLists < ActiveRecord::Migration[8.1]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :comment
      t.references :user, null: false, foreign_key: true
      t.references :venue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
