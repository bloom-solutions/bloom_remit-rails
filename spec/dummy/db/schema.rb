# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160806054012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "billers", force: :cascade do |t|
    t.string "slug"
  end

  create_table "bloom_remit_responses", force: :cascade do |t|
    t.integer  "txn_id",     null: false
    t.text     "body",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bloom_remit_responses", ["txn_id"], name: "index_bloom_remit_responses_on_txn_id", using: :btree

  create_table "bloom_remit_txns", force: :cascade do |t|
    t.integer "status",       default: 0, null: false
    t.string  "sender_id",                null: false
    t.string  "sender_type",              null: false
    t.decimal "amount",                   null: false
    t.string  "account_name"
    t.string  "account_id"
    t.uuid    "secret",                   null: false
    t.string  "target_slug",              null: false
    t.string  "owner_id"
    t.string  "owner_type"
  end

  add_index "bloom_remit_txns", ["owner_id", "owner_type"], name: "index_bloom_remit_txns_on_owner_id_and_owner_type", using: :btree

  create_table "payments", force: :cascade do |t|
    t.string "type"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "bloom_remit_id"
    t.string "type"
  end

end
