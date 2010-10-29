class ImportJob < ActiveRecord::Base
  belongs_to :importable, :polymorphic => true
  has_many :job, :as => :jobable
  has_many :column_relations
  has_many :column_filters
  belongs_to :import_method
  belongs_to :currency_buy, :class_name => 'Currency'
  belongs_to :currency_sell, :class_name => 'Currency'
  belongs_to :currency_weight, :class_name => 'Currency'
end
