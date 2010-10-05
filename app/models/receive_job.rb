class ReceiveJob < ActiveRecord::Base
  belongs_to :receiveable, :polymorphic => true
  has_many :job, :as => :jobable
end