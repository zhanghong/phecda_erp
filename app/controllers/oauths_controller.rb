class OauthsController < ApplicationController
	def tb_callback
		if params[:code]
			Tb::Shop.create_by_authorization_code(params[:code])
		elsif params[:error]
			# error == access_denied
			# error_description == authorize reject
		end
		render text: "hello callback"
	end
end
