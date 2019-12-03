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

ActiveRecord::Schema.define(version: 2019_12_03_110532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "composts", force: :cascade do |t|
    t.string "title"
    t.string "address"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.text "description"
    t.text "access_data"
    t.string "image_url"
    t.boolean "is_open"
    t.integer "filling"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contributions", force: :cascade do |t|
    t.datetime "contribution_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "username"
    t.string "email"
    t.string "address"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "avatar_url"
    t.boolean "is_composter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
<<<<<<< HEAD
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
=======
>>>>>>> 6f478b305b25c6a48028c2931557335f8b3cfe56
  end

end
