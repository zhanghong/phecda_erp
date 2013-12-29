# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# response = TaobaoFu.get(:method => 'taobao.sellercats.list.get',
#              :nick => "sandbox_zhanghong"
#              )
# p response

# Sys::Category.first.sync_to_taobao

# str = <<-HT
#   #https://oauth.tbsandbox.com/authorize?response_type=code&client_id=1021670514&redirect_uri=http%3A%2F%2Ferp.henry.com%2Foauths%2Ftb_callback&from_site=fuwu
# HT
# Tb::Query.refresh_token

# Sys::Category.first.sync_to_taobao
# Tb::Query.refresh_sbsandbox_token

shop = Tb::Shop.find_by_id(1)
# shop.pull_taobao_info
Tb::Category.pull_shop_categories(shop)
# Tb::Product.pull_shop_items(shop)

# Tb::Query.build_sandbox_aouth_url