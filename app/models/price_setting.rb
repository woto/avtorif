class PriceSetting < ActiveRecord::Base
  belongs_to :import_job

  belongs_to :currency_buy, :class_name => 'Currency'
  validates_presence_of :currency_buy

  belongs_to :currency_weight, :class_name => 'Currency'
  has_many :import_jobs

  validates_numericality_of :retail_rate, :greater_than => 0, :less_than => 1000
  validates_numericality_of :absolute_buy_rate, :greater_than_or_equal_to => 0, :less_than => 1000
  validates_numericality_of :relative_buy_rate, :greater_than => 0, :less_than => 1000
  validates_numericality_of :absolute_weight_rate, :greater_than_or_equal_to => 0, :less_than => 1000
  validates_numericality_of :relative_weight_rate, :greater_than_or_equal_to => 0, :less_than => 1000
  validates_numericality_of :kilo_price, :greater_than_or_equal_to => 0, :less_than => 1000, :allow_nil => true
  validates_numericality_of :weight_unavailable_rate, :greater_than_or_equal_to => 0, :less_than => 1000, :allow_nil => true

  belongs_to :supplier

end
