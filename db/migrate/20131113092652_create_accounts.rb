class CreateAccounts < ActiveRecord::Migration
  def change
    create_table "accounts", :force => true do |t|
      t.string   "name"
      t.string   "key"
      t.datetime "created_at",        :null => false
      t.datetime "updated_at",        :null => false
      t.string   "seller_name"
      t.string   "address"
      t.string   "phone"
      t.string   "deliver_bill_info"
      t.string   "point_out"
      t.string   "website"
      t.timestamps
    end
  end
end
