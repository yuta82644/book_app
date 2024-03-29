class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.date :published_date
      t.string :image_url
      t.text :review
      t.date :read_date

      t.timestamps
    end
  end
end
