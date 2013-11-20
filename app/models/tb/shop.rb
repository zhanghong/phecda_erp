# create_table "tb_shops", force: true do |t|
#     t.integer  "account_id",     limit: 8,  default: 0
#     t.integer  "sid",                       default: 0
#     t.integer  "cid",                       default: 0
#     t.string   "nick",           limit: 30, default: ""
#     t.string   "title",          limit: 50, default: ""
#     t.string   "auth_type",      limit: 10, default: ""
#     t.string   "desc",                      default: ""
#     t.string   "bulletin",                  default: ""
#     t.string   "pic_path",                  default: ""
#     t.datetime "tb_created_at"
#     t.datetime "tb_modified_at"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end
class Tb::Shop < ActiveRecord::Base
  belongs_to  :account
end
