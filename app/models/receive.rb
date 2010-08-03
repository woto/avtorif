class Receive < ActiveRecord::Base
  belongs_to :price  
  belongs_to :receiveable, :polymorphic => true
  has_one :job, :as => :jobable
  #has_many :files
end
