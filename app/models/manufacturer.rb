# encoding: utf-8

class Manufacturer < ActiveRecord::Base

  MANUFACTURER_LEN = AppConfig.manufacturer_len 

  has_many :autos
  has_many :manufacturer_synonyms, :dependent => :destroy
  #accepts_nested_attributes_for :manufacturer_synonyms
  validates :title, :uniqueness => {:case_sensitive => false}

  belongs_to :job
  before_save :upcase

  def upcase
    self.title = self.title.to_s.mb_chars.strip.upcase[0, MANUFACTURER_LEN].to_s
  end

  def to_s
    title
  end

end
