class ReceiveJob < ActiveRecord::Base
  belongs_to :receiveable, :polymorphic => true
  has_many :job, :as => :jobable

 #accepts_nested_attributes_for :ftp_receive
end