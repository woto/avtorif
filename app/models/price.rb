class Price < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :receive, :polymorphic => true, :dependent => :destroy
  has_many :goods
end