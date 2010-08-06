class Goods < ActiveRecord::Base
  has_many :prices
  belongs_to :manufacturer

  has_many :goods_as_original, :foreign_key => 'original_id', :class_name => 'Analogue'
  has_many :goods_as_analogue, :foreign_key => 'analogue_id',   :class_name => 'Analogue'
  has_many :originals, :through => :goods_as_analogue
  has_many :analogues, :through => :goods_as_original
end