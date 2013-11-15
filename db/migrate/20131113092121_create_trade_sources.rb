class CreateTradeSources < ActiveRecord::Migration
  def change
    create_table "trade_sources", :force => true do |t|
      t.integer  "account_id"
      t.string   "name"
      t.string   "app_key"
      t.string   "secret_key"
      t.string   "session"
      t.string   "trade_type"
      t.integer  "fetch_quantity",      :default => 20
      t.integer  "fetch_time_circle",   :default => 15
      t.boolean  "high_pressure_valve", :default => false
      t.integer  "sid"
      t.integer  "cid"
      t.datetime "created"
      t.datetime "modified"
      t.string   "bulletin"
      t.string   "title"
      t.string   "description"
      t.timestamps
    end

    add_index "trade_sources", ["account_id"], :name => "index_trade_sources_on_account_id"
  end
end
