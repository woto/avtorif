class Price < ActiveRecord::Base
  belongs_to :contractor
  belongs_to :settings, :polymorphic => true, :dependent => :destroy
end