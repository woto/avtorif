class ManufacturerSynonym < ActiveRecord::Base
  belongs_to :manufacturer
  validates :title, :uniqueness => {:case_sensitive => false}

  before_save :upcase

  def upcase
    self.title = self.title.mb_chars.strip.upcase.to_s
  end

  def to_s
    title
  end

end
