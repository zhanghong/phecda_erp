# rake init_real_system --trace
task :init_real_system => :environment do
  admin = User.find_or_create_by(name: "admin")
  admin.update({mobile: "18622198805", email: "admin@test.com", password: "12345678", role: "super_admin", sign_in_count: 0})

  account = Account.find_or_create_by(name: "XX专卖店")

  shop = Tb::Shop.find_or_create_by(nick: "sandbox_zhanghong")
  shop.update(account_id: account.id)

  # https://oauth.tbsandbox.com/authorize?response_type=code&client_id=1021670514&redirect_uri=http%3A%2F%2Ferp.zhanghong.com&from_site=fuwu
  token_info = {
    shop_id: shop.id,
    w2_expires_in: 1800,
    user_id: "3611765114",
    nick: "sandbox_zhanghong",
    w1_expires_in: 12960000,
    re_expires_in: 15552000,
    r2_expires_in: 259200,
    expires_in: 12960000,
    token_type: "Bearer",
    refresh_token: "6201d120ef657a9d5821ZZdb86c761a40403cf9df3c7ed33611765114",
    access_token: "6201812248f169ed571bdf63fb35bf11293ab41f455d7ca3611765114",
    r1_expires_in: 12960000
	}
  app_token = Tb::AppToken.find_or_create_by(nick: shop.nick)
  app_token.update(token_info)

  session_info = {
  	shop_id: shop.id,
    nick: "sandbox_zhanghong",
    app_key: "1021670514",
    app_secret:	"sandboxcfb450954a95d9f6b48ad4112",
    session_key: "610142022bf5b6f035482efe95101737309cb8494295c243611765114",
    expires_at: Time.local(2014, 4, 23, 14, 52, 59),
    refresh_token: "610142022bf5b6f035482efe95101737309cb8494295c243611765114",
    refresh_token_expires_at: Time.local(2014, 5, 23, 14, 52, 59),
    r1_expires_in: "1398235979633",
    r1_can_refresh: true,
    r2_expires_in: "1385535179633",
    r2_can_refresh: true,
    w1_expires_in: "1398235979633",
    w1_can_refresh: true,
    w2_expires_in: "1385277779633",
    w2_can_refresh: false,
    is_sandbox: true,
    use_curl: false
  }
  app_session = Tb::AppSession.find_or_create_by(nick: shop.nick)
  app_session.update(session_info)
  shop.pull_taobao_info

  # ["心脑血管", "体重管理", "容颜", "骨骼关节", "抵抗力", "泌尿生殖", "基础营养", "孕妇营养", "睡眠", "眼部营养", "肝肠胃", "脑力智力", "内分泌", "运动营养", "赠品"].each do |cat_name|
  #   Sys::Category.find_or_create_by(name: cat_name, account_id: account.id)
  # end
  # Sys::Category.sync_to_taobao
end

