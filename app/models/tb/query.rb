# encoding : utf-8 -*-
require 'crack/json'
require 'oauth2'
module Tb::Query

  def self.get(options, shop_id = nil)
  	app_session = Tb::AppSession.where(shop_id: shop_id).first
  	if app_session
  		if true
  			TaobaoFu.select_app_session(app_session)
        TaobaoFu.get(options)
  		else
  			oauth_https_get(options, shop_id)
  		end
  	end
  end

  def self.oauth_https_get(options, shop_id = nil)
  	shop_app = Tb::AppToken.where(shop_id: shop_id).first
  	if shop_app
  		base_url = SETTINGS["base_url"]

  		sorted_params = {
        access_token: shop_app.access_token,
        format:      'json',
        v:           '2.0',
        timestamp:   Time.now.strftime("%Y-%m-%d %H:%M:%S")
      }.merge!(options)

      params_array = sorted_params.sort_by { |k,v| k.to_s }
      total_param = params_array.map { |key, value| key.to_s+"="+value.to_s }
      generate_query_string = URI.escape(total_param.join("&"))
      data = HTTParty.get(base_url + generate_query_string).parsed_response.to_json #Hash2JSON
      response = Crack::JSON.parse(data)
  	end
  end

  def self.get_oauth_token(shop_code)
  	base_url = SETTINGS["oauth_token_url"]
  	sorted_params = {
  		code: shop_code,
  		grant_type: "authorization_code",
  		client_id: SETTINGS["app_key"],
  		client_secret: SETTINGS["secret_key"],
  		redirect_uri: SETTINGS["oauth_callback_url"]
  	}

  	params_array = sorted_params.sort_by { |k,v| k.to_s }
    total_param = params_array.map { |key, value| key.to_s+"="+value.to_s }
    generate_query_string = URI.escape(total_param.join("&"))
    # puts "1111........."
    # puts base_url + generate_query_string
    # puts "============ "
    data = HTTParty.post(base_url + generate_query_string).parsed_response.to_json #Hash2JSON
    response = Crack::JSON.parse(data)
  end
end

