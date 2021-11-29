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

ActiveRecord::Schema.define(version: 2021_11_29_123058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "association_food_tag_restaurants", id: false, force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.bigint "food_tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_tag_id"], name: "index_association_food_tag_restaurants_on_food_tag_id"
    t.index ["restaurant_id"], name: "index_association_food_tag_restaurants_on_restaurant_id"
  end

  create_table "association_user_restaurants", id: false, force: :cascade do |t|
    t.integer "score"
    t.string "commentary", limit: 200
    t.bigint "user_id", null: false
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_association_user_restaurants_on_restaurant_id"
    t.index ["user_id"], name: "index_association_user_restaurants_on_user_id"
  end

  create_table "dish_categories", force: :cascade do |t|
    t.string "name", limit: 16
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_dish_categories_on_restaurant_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name", limit: 16
    t.string "details", limit: 130
    t.decimal "price", precision: 6, scale: 2
    t.bigint "dish_category_id", null: false
    t.bigint "menu_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dish_category_id"], name: "index_dishes_on_dish_category_id"
    t.index ["menu_id"], name: "index_dishes_on_menu_id"
  end

  create_table "food_tags", force: :cascade do |t|
    t.string "name", limit: 24
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string "name", limit: 16
    t.decimal "price", precision: 6, scale: 2
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_menus_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", limit: 24
    t.string "description", limit: 130
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 16
    t.string "firstname", limit: 16
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "association_food_tag_restaurants", "food_tags"
  add_foreign_key "association_food_tag_restaurants", "restaurants"
  add_foreign_key "association_user_restaurants", "restaurants"
  add_foreign_key "association_user_restaurants", "users"
  add_foreign_key "dish_categories", "restaurants"
  add_foreign_key "dishes", "dish_categories"
  add_foreign_key "dishes", "menus"
  add_foreign_key "menus", "restaurants"
end
