# encoding: utf-8

class Currency < ActiveRecord::Base
  has_many :import_jobs
  validates :title, :presence => true
  #validates :foreign_id, :format => {:with => /^[a-z]{3}$/, :message => "код может содержать только три символа латинского алфавита"}
  validates_numericality_of :value, :numericality => true, :presence => true, :greater_than => 0
end
