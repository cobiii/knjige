class AddNumberToChapters < ActiveRecord::Migration[5.1]
  def change
    add_column :chapters, :number, :integer
  end
end
