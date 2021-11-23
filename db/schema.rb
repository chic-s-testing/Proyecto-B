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

ActiveRecord::Schema.define(version: 2021_11_23_013141) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "functions", force: :cascade do |t|
    t.string "schedule"
    t.integer "room"
    t.bigint "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_functions_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.date "initialDate"
    t.date "finalDate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "seat"
    t.date "day"
    t.bigint "function_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["function_id"], name: "index_reservations_on_function_id"
  end

  add_foreign_key "functions", "movies"
  add_foreign_key "reservations", "functions"
end
