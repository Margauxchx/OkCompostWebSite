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

ActiveRecord::Schema.define(version: 2019_12_05_072540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "composts", force: :cascade do |t|
    t.bigint "composter_id"
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
    t.index ["composter_id"], name: "index_composts_on_composter_id"
  end

  create_table "contributions", force: :cascade do |t|
    t.bigint "contributor_id"
    t.bigint "supplied_compost_id"
    t.datetime "contribution_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contributor_id"], name: "index_contributions_on_contributor_id"
    t.index ["supplied_compost_id"], name: "index_contributions_on_supplied_compost_id"
  end

  create_table "result_lines", force: :cascade do |t|
    t.integer "rank", default: 0
    t.bigint "result_id"
    t.bigint "compost_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["compost_id"], name: "index_result_lines_on_compost_id"
    t.index ["result_id"], name: "index_result_lines_on_result_id"
  end

  create_table "results", force: :cascade do |t|
    t.bigint "user_id"
    t.string "district", default: ""
    t.string "composition", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
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
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "taggings", "tags"
end
