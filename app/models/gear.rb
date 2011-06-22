# encoding: utf-8

class Gear < ActiveRecord::Base
  has_many :auto_options
end
