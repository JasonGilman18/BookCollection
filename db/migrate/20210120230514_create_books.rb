class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.integer :price
      t.timestamp :published_date

      t.timestamps
    end
  end
end
