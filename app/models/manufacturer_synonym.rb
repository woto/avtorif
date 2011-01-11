class ManufacturerSynonym < ActiveRecord::Base
  belongs_to :manufacturer
  validates :title, :uniqueness => {:case_sensitive => false}

  before_save :upcase

  def upcase
    self.title.upcase!
  end

end
