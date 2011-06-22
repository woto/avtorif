# encoding: utf-8

class GoodsAutoOption < ActiveRecord::Base
  belongs_to :goods
  belongs_to :auto_option

  belongs_to :goods
  belongs_to :auto_option

  def to_s
    auto_period.to_s + " : " + (goods.blank? ? '' : goods) + " : " + quantity.to_s
  end

end
