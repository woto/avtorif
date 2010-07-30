class Price < ActiveRecord::Base
  belongs_to :contractor
  belongs_to :receive_settings, :polymorphic => true, :dependent => :destroy
  has_many :goods
end