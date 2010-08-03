class Price < ActiveRecord::Base
  belongs_to :supplier
  has_many :goods
  has_one :receive, :as => :receiveable, :dependent => :destroy
  has_one :import, :as => :importable, :dependent => :destroy
end