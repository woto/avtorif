class Import < ActiveRecord::Base
  belongs_to :price
  belongs_to :importable, :polymorphic => true, :dependent => :destroy
  has_one :job, :as => :jobable, :dependent => :destroy
end