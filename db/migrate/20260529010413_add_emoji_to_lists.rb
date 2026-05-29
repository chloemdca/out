class AddEmojiToLists < ActiveRecord::Migration[8.1]
  def change
    add_column :lists, :emoji, :string
  end
end
