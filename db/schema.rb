
ActiveRecord::Schema.define(version: 2024_02_16_185447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.date "published_date"
    t.string "image_url"
    t.text "review"
    t.date "read_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
