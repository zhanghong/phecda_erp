#class OauthsController < Devise::OmniauthCallbacksController
class OauthsController < ApplicationController
	def taobao
    Tb::Shop.create_by_oauth(auth_hash)
		# if params[:code]
		# 	Tb::Shop.create_by_authorization_code(params[:code])
		# elsif params[:error]
		# 	# error == access_denied
		# 	# error_description == authorize reject
		# end
		render text: "hello callback"
	end
protected
  def auth_hash
    request.env['omniauth.auth']
  end
end
