# create_table "tb_products", force: true do |t|
#   t.integer  "shop_id"
#   t.integer  "category_id",                default: 0
#   t.string   "title",          limit: 100, default: ""
#   t.integer  "num",                        default: 0
#   t.text     "description"
#   t.string   "approve_status", limit: 15,  default: "instock"
#   t.boolean  "has_discount",               default: false
#   t.string   "image"
#   t.string   "outer_id"
#   t.string   "product_id",     limit: 20,  default: ""
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end
# add_index "tb_products", ["shop_id", "category_id"], name: "idx_by_shop_id_and_category_id", using: :btree
# add_index "tb_products", ["shop_id", "title"], name: "idx_by_shop_id_and_title", using: :btree
class Tb::Product < ActiveRecord::Base
	belongs_to	:shop,	class_name: "Tb::Shop"
	belongs_to	:category,	class_name: "Tb::Category"
	has_many		:skus,			class_name: "Tb::Sku"
end
