# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_12_122943) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "item_id"
    t.index ["item_id"], name: "index_chatrooms_on_item_id"
    t.index ["user_id"], name: "index_chatrooms_on_user_id"
  end

  create_table "claims", force: :cascade do |t|
    t.text "content"
    t.bigint "communitytask_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.boolean "completed", default: false
    t.index ["communitytask_id"], name: "index_claims_on_communitytask_id"
  end

  create_table "communitytasks", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "title"
    t.string "description"
    t.boolean "automatic_verification", default: false
    t.string "verification"
    t.integer "coin_reward"
  end

  create_table "contests", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.integer "user_id"
  end

  create_table "donationregs", force: :cascade do |t|
    t.text "content"
    t.bigint "donation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["donation_id"], name: "index_donationregs_on_donation_id"
  end

  create_table "donations", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "title"
    t.string "location"
    t.string "address"
    t.string "description"
    t.string "googlemapslink"
    t.string "time"
    t.string "date"
  end

  create_table "items", force: :cascade do |t|
    t.string "category"
    t.string "brand"
    t.integer "price"
    t.string "condition"
    t.string "size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
    t.integer "user_id"
    t.string "currency"
    t.string "location"
    t.float "latitude"
    t.float "longitude"
    t.string "title"
    t.integer "skatezarcoins", default: 0
    t.boolean "sold", default: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "read", default: false, null: false
    t.boolean "maildelivered", default: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "pages", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "skateevents", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name_title"
    t.date "date"
    t.string "location"
    t.string "address"
    t.string "time"
    t.string "googlemapslink"
    t.string "description"
    t.string "contest_or_session"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "contest_type"
    t.float "longitude"
    t.float "latitude"
    t.string "fblink"
    t.string "youtubelink"
    t.string "sponsors"
    t.date "date2"
    t.index ["user_id"], name: "index_skateevents_on_user_id"
  end

  create_table "skatespots", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "location"
    t.string "type_of_spot"
    t.string "description"
    t.integer "user_id"
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.string "googlemapslink"
  end

  create_table "skatezarcoinorders", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "firstname"
    t.string "lastname"
    t.string "address"
    t.string "country"
    t.string "postalcode"
    t.string "message"
    t.string "item"
    t.integer "item_id"
    t.integer "user_id"
    t.boolean "completed", default: false
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
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "instagram"
    t.text "description"
    t.string "username"
    t.string "stance"
    t.string "instavideolink"
    t.boolean "admin", default: false
    t.boolean "distributor", default: false
    t.string "location"
    t.string "age"
    t.string "gender"
    t.string "expo_push_token"
    t.integer "coins_earned", default: 0
    t.integer "coins_expensed", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "chatrooms", "items"
  add_foreign_key "chatrooms", "users"
  add_foreign_key "claims", "communitytasks"
  add_foreign_key "donationregs", "donations"
  add_foreign_key "items", "users"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "skateevents", "users"
  add_foreign_key "taggings", "tags"
end
