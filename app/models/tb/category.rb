# create_table "tb_categories", force: true do |t|
#   t.string   "name",       limit: 30, default: ""
#   t.integer  "shop_id",               default: 0
#   t.string   "status",     limit: 20, default: ""
#   t.integer  "parent_id",             default: 0
#   t.integer  "lft",                   default: 0
#   t.integer  "rgt",                   default: 0
#   t.integer  "depth",                 default: 0
#   t.integer  "use_days",              default: 1
#   t.datetime "created_at"
#   t.datetime "updated_at"
#   t.string   "tb_type",    limit: 20
#   t.string   "cid",        limit: 15
#   t.string   "parent_cid", limit: 15
#   t.string   "pic_url"
#   t.integer  "sort_order"
# end
# add_index "tb_categories", ["shop_id", "name"], name: "idx_by_shop_id_and_name", using: :btree
class Tb::Category < ActiveRecord::Base
	belongs_to	:shop,		class_name: "Tb::Shop"
	has_many	:products,	class_name: "Tb::Product"

	def self.pull_shop_categories(shop)
		return unless shop.is_a?(Tb::Shop)
		
		response = Tb::Query.get({
                method: "taobao.sellercats.list.get",
                nick: shop.nick
              }, shop.id)
    seller_cats = response["sellercats_list_get_response"]["seller_cats"]["seller_cat"]
    mappings = {"type" => "tb_type"}
    seller_cats.each do |cat|
      cat.keys.each do |k|
        cat[k] = CGI.unescape(cat[k]) if cat[k].is_a?(String)
        cat[mappings[k]] = cat.delete(k) if mappings[k]
      end
      tb_category = Tb::Category.find_or_initialize_by(shop_id: shop.id, name: cat["name"])
      tb_category.update(cat)
    end
	end
end
