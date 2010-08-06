class ImportJob < ActiveRecord::Base
  belongs_to :importable, :polymorphic => true
  has_one :job, :as => :jobable
end
