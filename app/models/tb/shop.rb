# create_table "tb_shops", force: true do |t|
#   t.integer  "account_id",     limit: 8,  default: 0
#   t.string   "cid",            limit: 20, default: ""
#   t.string   "nick",           limit: 30, default: ""
#   t.string   "title",          limit: 50, default: ""
#   t.string   "auth_type",      limit: 10, default: ""
#   t.string   "desc",                      default: ""
#   t.string   "bulletin",                  default: ""
#   t.string   "pic_path",                  default: ""
#   t.datetime "tb_created_at"
#   t.datetime "tb_modified_at"
#   t.datetime "created_at"
#   t.datetime "updated_at"
#   t.string   "user_id",        limit: 20, default: ""
#   t.string   "sid",            limit: 20, default: ""
# end
class Tb::Shop < ActiveRecord::Base
  belongs_to  :account
  has_many    :app_token, class_name: "Tb::AppToken",  foreign_key: "shop_id"
  has_many    :categories,  class_name: "Tb::Category",   foreign_key: "shop_id"
  has_many    :products,  class_name: "Tb::Product",   foreign_key: "shop_id"
  has_many    :sku,  class_name: "Tb::Product",   foreign_key: "shop_id"
  has_many    :properties,  class_name: "Tb::Property",   foreign_key: "shop_id" 
  has_many    :property_values,  class_name: "Tb::PropertyValue",   foreign_key: "shop_id" 

  def self.create_by_authorization_code(code)
    res = Tb::Query.get_oauth_token(code)
    if res["error"]
      return false
    else
      shop = find_or_initialize_by(nick: res["taobao_user_nick"])
      shop.update({
        user_id: res["taobao_user_id"],
        auth_type: "oauth2"
        })
      shop.pull_taobao_info
      shop.save_access_token(res)
    end
    return true
  end

  def pull_taobao_info
  	response = Tb::Query.get({
					  		method: "taobao.shop.get",
					  		fields: "sid,cid,title,desc,bulletin,pic_path,created,modified",
					  		nick: nick
					  	}, self.id)
  	res_shop = response["shop_get_response"]["shop"]
    mappings = {"created" => "tb_created_at", "modified" => "tb_modified_at"}
    res_shop.keys.each do |k|
      res_shop[mappings[k]] = res_shop.delete(k) if mappings[k]
    end
  	self.update(res_shop)
  end

  def save_access_token(res)
    app_token = Tb::AppToken.find_or_create_by(shop_id: id)

    mappings = {"taobao_user_id" => "user_id", "taobao_user_nick" => "nick"}
    res.keys.each do |k|
      res[mappings[k]] = res.delete(k) if mappings[k]
    end
    app_token.update(res)
  end
end
