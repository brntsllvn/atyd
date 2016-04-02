class AddVotesTable < ActiveRecord::Migration
  create_table "votes", force: :cascade do |t|
    t.integer "comic_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
  end
end
