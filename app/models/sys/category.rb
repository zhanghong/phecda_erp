class Sys::Category < ActiveRecord::Base
  belongs_to  :account

  def self.sync_to_taobao
    self.all.each do |category|
      category.sync_to_taobao
    end
  end

  def sync_to_taobao
    response = TaobaoFu.get(method: 'taobao.sellercats.list.add',
                   name: self.name,
                   pict_url: self.pic_url,
                   parent_cid: self.parent_id
               )
    puts response.class
    p response
    seller_cat = response["sellercats_list_add_response"]["seller_cat"] rescue {}
    if seller_cat.present?
      self.update(taobao_id: seller_cat["cid"], taobao_updated_at: seller_cat["created"])
    end
  end
end
