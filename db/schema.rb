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

ActiveRecord::Schema.define(version: 20131222092803) do

  create_table "accounts", force: true do |t|
    t.string   "name",       limit: 30, default: ""
    t.string   "phone",      limit: 13, default: ""
    t.string   "email",      limit: 50, default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sys_categories", force: true do |t|
    t.string   "name",              limit: 30, default: ""
    t.integer  "account_id",                   default: 0
    t.string   "status",            limit: 20, default: ""
    t.integer  "parent_id",                    default: 0
    t.integer  "lft",                          default: 0
    t.integer  "rgt",                          default: 0
    t.integer  "depth",                        default: 0
    t.integer  "use_days",                     default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic_url",                      default: ""
    t.integer  "sort_order"
    t.integer  "taobao_id",                    default: 0
    t.datetime "taobao_updated_at"
  end

  create_table "sys_products", force: true do |t|
    t.integer "account_id"
    t.integer "category_id",                default: 0
    t.string  "title",          limit: 100, default: ""
    t.integer "num",                        default: 0
    t.text    "description"
    t.string  "approve_status", limit: 15,  default: "instock"
    t.boolean "has_discount",               default: false
    t.string  "image"
    t.string  "outer_id"
    t.string  "product_id",     limit: 30
  end

  add_index "sys_products", ["account_id", "category_id"], name: "idx_by_account_id_and_category_id", using: :btree

  create_table "sys_properties", force: true do |t|
    t.integer  "account_id",            default: 0
    t.string   "name",       limit: 30, default: ""
    t.string   "status",     limit: 20, default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sys_properties", ["account_id", "name"], name: "idx_by_account_id_and_name", using: :btree
  add_index "sys_properties", ["account_id", "status"], name: "idx_by_account_id_and_status", using: :btree

  create_table "sys_property_values", force: true do |t|
    t.integer  "account_id",             default: 0
    t.integer  "property_id",            default: 0
    t.string   "name",        limit: 20, default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sys_property_values", ["account_id", "property_id"], name: "idx_by_account_id_and_property_id", using: :btree

  create_table "sys_sku_property_values", force: true do |t|
    t.integer  "sku_id",            default: 0
    t.integer  "property_value_id", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sys_sku_property_values", ["sku_id", "property_value_id"], name: "idx_by_sku_id_and_property_id", using: :btree

  create_table "sys_skus", force: true do |t|
    t.integer  "account_id",            default: 0
    t.string   "product_id", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sys_skus", ["account_id", "product_id"], name: "idx_by_account_id_and_product_id", using: :btree

  create_table "tb_app_sessions", force: true do |t|
    t.integer  "shop_id"
    t.string   "nick",                     limit: 30
    t.string   "app_key",                  limit: 20
    t.string   "app_secret",               limit: 80
    t.string   "session_key",              limit: 80
    t.integer  "expires_at"
    t.string   "refresh_token",            limit: 80
    t.date     "refresh_token_expires_at"
    t.string   "r1_expires_in"
    t.boolean  "r1_can_refresh",                      default: false
    t.string   "r2_expires_in"
    t.boolean  "r2_can_refresh",                      default: false
    t.string   "w1_expires_in"
    t.boolean  "w1_can_refresh",                      default: false
    t.string   "w2_expires_in"
    t.boolean  "w2_can_refresh",                      default: false
    t.boolean  "is_sandbox",                          default: false
    t.boolean  "use_curl",                            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tb_app_tokens", force: true do |t|
    t.integer  "shop_id"
    t.string   "user_id",       limit: 20, default: ""
    t.string   "nick",          limit: 30
    t.string   "access_token"
    t.string   "token_type",    limit: 30
    t.integer  "expires_in"
    t.string   "refresh_token"
    t.integer  "re_expires_in"
    t.integer  "r1_expires_in"
    t.integer  "r2_expires_in"
    t.integer  "w1_expires_in"
    t.integer  "w2_expires_in"
    t.integer  "sub_user_id"
    t.string   "sub_nick",      limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tb_app_tokens", ["shop_id"], name: "idx_by_shop_id", using: :btree

  create_table "tb_categories", force: true do |t|
    t.string   "name",       limit: 30, default: ""
    t.integer  "shop_id",               default: 0
    t.string   "status",     limit: 20, default: ""
    t.integer  "parent_id",             default: 0
    t.integer  "lft",                   default: 0
    t.integer  "rgt",                   default: 0
    t.integer  "depth",                 default: 0
    t.integer  "use_days",              default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tb_categories", ["shop_id", "name"], name: "idx_by_shop_id_and_name", using: :btree

  create_table "tb_products", force: true do |t|
    t.integer  "shop_id"
    t.integer  "category_id",                default: 0
    t.string   "title",          limit: 100, default: ""
    t.integer  "num",                        default: 0
    t.text     "description"
    t.string   "approve_status", limit: 15,  default: "instock"
    t.boolean  "has_discount",               default: false
    t.string   "image"
    t.string   "outer_id"
    t.string   "product_id",     limit: 20,  default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tb_products", ["shop_id", "category_id"], name: "idx_by_shop_id_and_category_id", using: :btree
  add_index "tb_products", ["shop_id", "title"], name: "idx_by_shop_id_and_title", using: :btree

  create_table "tb_properties", force: true do |t|
    t.integer  "shop_id",               default: 0
    t.string   "name",       limit: 30, default: ""
    t.string   "status",     limit: 20, default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tb_properties", ["shop_id", "name"], name: "idx_by_shop_id_and_name", using: :btree
  add_index "tb_properties", ["shop_id", "status"], name: "idx_by_shop_id_and_status", using: :btree

  create_table "tb_property_values", force: true do |t|
    t.integer  "shop_id",                default: 0
    t.integer  "property_id",            default: 0
    t.string   "name",        limit: 20, default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tb_property_values", ["shop_id", "property_id"], name: "idx_by_shop_id_and_property_id", using: :btree

  create_table "tb_shops", force: true do |t|
    t.integer  "account_id",     limit: 8,  default: 0
    t.integer  "sid",                       default: 0
    t.integer  "cid",                       default: 0
    t.string   "nick",           limit: 30, default: ""
    t.string   "title",          limit: 50, default: ""
    t.string   "auth_type",      limit: 10, default: ""
    t.string   "desc",                      default: ""
    t.string   "bulletin",                  default: ""
    t.string   "pic_path",                  default: ""
    t.datetime "tb_created_at"
    t.datetime "tb_modified_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tb_sku_properties", force: true do |t|
    t.integer  "sku_id",            default: 0
    t.integer  "property_value_id", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tb_sku_properties", ["sku_id", "property_value_id"], name: "idx_by_sku_id_and_property_id", using: :btree

  create_table "tb_skus", force: true do |t|
    t.integer  "shop_id",               default: 0
    t.string   "product_id", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tb_skus", ["shop_id", "product_id"], name: "idx_by_shop_id_and_product_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",                   limit: 20, default: "", null: false
    t.string   "mobile",                 limit: 13, default: "", null: false
    t.string   "email",                  limit: 40, default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "role",                   limit: 15, default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",                   default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
