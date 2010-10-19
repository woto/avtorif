class Period < ActiveRecord::Base
  has_many :auto_options, :dependent => :destroy
  has_many :autos, :through => :auto_options

  def to_s
    "#{thousand_kilometers} км, #{months} мес"
  end

end
