# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_05_09_203740) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "effects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "effects_strains", id: false, force: :cascade do |t|
    t.bigint "strain_id", null: false
    t.bigint "effect_id", null: false
    t.index ["strain_id", "effect_id"], name: "index_effects_strains_on_strain_id_and_effect_id"
  end

  create_table "flavors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flavors_strains", id: false, force: :cascade do |t|
    t.bigint "strain_id", null: false
    t.bigint "flavor_id", null: false
    t.index ["strain_id", "flavor_id"], name: "index_flavors_strains_on_strain_id_and_flavor_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.decimal "rating", precision: 2, scale: 1
    t.integer "strain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "strains", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type_name"
    t.string "description"
    t.string "strain_effects"
    t.string "strain_flavors"
    t.decimal "average_rating", precision: 2, scale: 1
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
