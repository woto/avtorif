class Manufacturer < ActiveRecord::Base
  has_many :autos

  def to_s
    title
  end

end
