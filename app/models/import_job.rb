class ImportJob < ActiveRecord::Base
  belongs_to :importable, :polymorphic => true
  has_one :job, :as => :jobable
  has_many :column_relations
  has_many :column_filters
  belongs_to :import_method
end
