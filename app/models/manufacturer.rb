class Manufacturer < ActiveRecord::Base
  has_many :autos
  has_many :manufacturer_synonyms, :dependent => :destroy
  #accepts_nested_attributes_for :manufacturer_synonyms
  validates :title, :uniqueness => {:case_sensitive => false}

  before_save :upcase

  def upcase
    self.title = self.title.to_s.mb_chars.strip.upcase.to_s
  end

  def to_s
    title
  end

end
