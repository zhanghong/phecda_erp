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

  def pull_taobao_info
  	response = Tb::Query.get({
					  		method: "taobao.shop.get",
					  		fields: "sid,cid,title,desc,bulletin,pic_path,created,modified",
					  		nick: self.nick
					  	}, self.id)
  	res_shop = response["shop_get_response"]["shop"]
    {created: "tb_created_at", modified: "tb_modified_at"}.each do |key, attr|
      key = key.to_s
      res_shop[attr] = res_shop[key]
      res_shop.delete(key)
    end
  	self.update(res_shop)
  end
end
