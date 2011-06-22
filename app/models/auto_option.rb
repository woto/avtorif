# encoding: utf-8

class AutoOption < ActiveRecord::Base
  belongs_to :auto
  belongs_to :period
  belongs_to :transmission
  belongs_to :gear
  belongs_to :fuel

  has_many :goods_auto_options
  has_many :goods, :through => :goods_auto_options

  def to_label
    auto.to_label + " - " + period.to_s + " - " + transmission.to_s
  end


end
