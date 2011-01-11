class Manufacturer < ActiveRecord::Base
  has_many :autos
  validates :title, :uniqueness => {:case_sensitive => false}
  has_many :manufacturer_synonyms

  before_save :upcase

  def upcase
    self.title.upcase!
  end

  def to_s
    title
  end

end
