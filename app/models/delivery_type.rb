# encoding: utf-8

class DeliveryType < ActiveRecord::Base
  has_many :import_jobs
end
