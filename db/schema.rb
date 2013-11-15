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

ActiveRecord::Schema.define(version: 20131113092652) do

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "seller_name"
    t.string   "address"
    t.string   "phone"
    t.string   "deliver_bill_info"
    t.string   "point_out"
    t.string   "website"
  end

  create_table "taobao_app_tokens", force: true do |t|
    t.integer  "account_id"
    t.string   "access_token"
    t.string   "taobao_user_id"
    t.string   "taobao_user_nick"
    t.string   "refresh_token"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.datetime "last_refresh_at"
    t.integer  "trade_source_id"
    t.datetime "refresh_token_last_refresh_at"
    t.integer  "re_expires_in",                 limit: 8
    t.integer  "r1_expires_in",                 limit: 8
    t.integer  "r2_expires_in",                 limit: 8
    t.integer  "w1_expires_in",                 limit: 8
    t.integer  "w2_expires_in",                 limit: 8
    t.boolean  "need_refresh",                            default: true
  end

  create_table "trade_sources", force: true do |t|
    t.integer  "account_id"
    t.string   "name"
    t.string   "app_key"
    t.string   "secret_key"
    t.string   "session"
    t.string   "trade_type"
    t.integer  "fetch_quantity",      default: 20
    t.integer  "fetch_time_circle",   default: 15
    t.boolean  "high_pressure_valve", default: false
    t.integer  "sid"
    t.integer  "cid"
    t.datetime "created"
    t.datetime "modified"
    t.string   "bulletin"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trade_sources", ["account_id"], name: "index_trade_sources_on_account_id", using: :btree

end
