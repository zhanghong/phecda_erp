# create_table "tb_property_values", force: true do |t|
#   t.integer  "shop_id",                default: 0
#   t.integer  "property_id",            default: 0
#   t.string   "name",        limit: 20, default: ""
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end

# add_index "tb_property_values", ["shop_id", "property_id"], name: "idx_by_shop_id_and_property_id", using: :btree

class Tb::PropertyValue < ActiveRecord::Base
	belongs_to	:shop,	class_name: "Tb::Shop"
	belongs_to	:property,	class_name: "Tb::Property"
end
