class CreateTaobaoAppTokens < ActiveRecord::Migration
  def change
    create_table "taobao_app_tokens", :force => true do |t|
      t.integer  "account_id"
      t.string   "access_token"
      t.string   "taobao_user_id"
      t.string   "taobao_user_nick"
      t.string   "refresh_token"
      t.datetime "last_refresh_at"
      t.integer  "trade_source_id"
      t.datetime "refresh_token_last_refresh_at"
      t.integer  "re_expires_in",                 :limit => 8
      t.integer  "r1_expires_in",                 :limit => 8
      t.integer  "r2_expires_in",                 :limit => 8
      t.integer  "w1_expires_in",                 :limit => 8
      t.integer  "w2_expires_in",                 :limit => 8
      t.boolean  "need_refresh",                               :default => true
      t.timestamps
    end

    add_index "taobao_app_tokens", ["account_id"], :name => "index_taobao_app_tokens_on_account_id"
    add_index "taobao_app_tokens", ["trade_source_id"], :name => "index_taobao_app_tokens_on_trade_source_id"
  end
end
