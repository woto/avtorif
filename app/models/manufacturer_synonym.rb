class ManufacturerSynonym < ActiveRecord::Base
  MANUFACTURER_LEN = AppConfig.manufacturer_len

  belongs_to :manufacturer
  validates_presence_of :manufacturer
  validates :title, :uniqueness => {:case_sensitive => false}

  before_save :upcase

  def upcase
    self.title = self.title.to_s.mb_chars.strip.upcase[0, MANUFACTURER_LEN].to_s
  end

  def to_s
    title
  end

end
