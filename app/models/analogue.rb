# encoding: utf-8

class Analogue < ActiveRecord::Base
  belongs_to :original, :foreign_key => "original_id", :class_name => "Goods"
  belongs_to :analogue, :foreign_key => "analogue_id", :class_name => "Goods"
end