class Price < ActiveRecord::Base
  belongs_to :supplier
  has_many :goods
  has_one :receive
  has_one :import
end