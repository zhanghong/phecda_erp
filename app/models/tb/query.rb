# encoding : utf-8 -*-
require 'crack/json'
require 'oauth2'
module Tb::Query
  #include FinderCache

  def self.get(options = {}, trade_source_id = nil)
    TaobaoFu.get(options)
  end
end