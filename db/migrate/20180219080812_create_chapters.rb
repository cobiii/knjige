class CreateChapters < ActiveRecord::Migration[5.1]
  def change
    create_table :chapters do |t|
      t.integer :user_id
      t.integer :book_id
      t.text :text
      t.timestamps
    end
  end
end
