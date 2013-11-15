class TradeSource < ActiveRecord::Base
  belongs_to  :account
  has_one :taobao_app_token
end
