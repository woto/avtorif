class Manufacturer < ActiveRecord::Base
  has_many :autos
  validates :title, :uniqueness => {:case_sensitive => false}
  has_many :manufacturer_synonyms, :dependent => :destroy
  validates_associated :manufacturer_synonyms

  before_save :upcase

  def upcase
    self.title = self.title.mb_chars.strip.upcase.to_s
  end

  def to_s
    title
  end

end
