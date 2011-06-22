# encoding: utf-8

class Transmission < ActiveRecord::Base
  has_many :auto_options
end
