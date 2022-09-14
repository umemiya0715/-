# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_14_053252) do
  create_table "authentications", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "provider", null: false
    t.string "uid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "access_token", default: "", null: false
    t.string "access_token_secret", default: "", null: false
    t.index ["provider", "uid"], name: "index_authentications_on_provider_and_uid"
  end

  create_table "dragons", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "image", null: false
    t.string "explanation", null: false
    t.string "personality", null: false
    t.string "advice", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "affinity", null: false
  end

  create_table "levels", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "current_level", default: 1, null: false
    t.integer "setting_level", default: 1, null: false
    t.integer "experience", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "leveluped_at"
    t.index ["user_id"], name: "index_levels_on_user_id"
  end

  create_table "results", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "dragon_id", null: false
    t.float "score", null: false
    t.float "magnitude", null: false
    t.float "troversion", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "target_account", null: false
    t.string "screen_name", default: "", null: false
    t.index ["dragon_id"], name: "index_results_on_dragon_id"
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "twitter_id", null: false
    t.string "name", null: false
    t.string "image"
    t.integer "role", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "screen_name", null: false
    t.index ["twitter_id"], name: "index_users_on_twitter_id", unique: true
  end

end
