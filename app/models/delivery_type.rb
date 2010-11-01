class DeliveryType < ActiveRecord::Base
  has_many :import_jobs
end
