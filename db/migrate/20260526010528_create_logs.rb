class CreateLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :logs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :venue, null: false, foreign_key: true
      t.date :date_visited
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
