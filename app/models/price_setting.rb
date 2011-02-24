class PriceSetting < ActiveRecord::Base
  has_many :import_jobs
  belongs_to :import_job
  belongs_to :supplier
  belongs_to :currency_buy, :class_name => 'Currency'
  belongs_to :currency_weight, :class_name => 'Currency'
end
