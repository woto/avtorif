class ReceiveJob < ActiveRecord::Base
  belongs_to :receiveable, :polymorphic => true
  has_many :job, :as => :jobable

  accepts_nested_attributes_for :receiveable
  accepts_nested_attributes_for :job

 # def build_receiveable(args)
 #   raise args.to_s
 # end


end
