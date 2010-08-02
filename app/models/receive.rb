class Receive < ActiveRecord::Base
  belongs_to :receiveable, :polymorphic => true, :dependent => :destroy
  belongs_to :price
  has_one :job, :as => :jobable, :dependent => :destroy
  has_many :files
end
