class Receive < ActiveRecord::Base
  belongs_to :price  
  belongs_to :receiveable, :polymorphic => true, :dependent => :destroy
  has_one :job, :as => :jobable, :dependent => :destroy
  #has_many :files
end
