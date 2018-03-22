class CreateBook < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.boolean :is_in_shelf
      t.timestamps
    end
  end
end
