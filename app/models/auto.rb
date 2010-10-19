class Auto < ActiveRecord::Base
  belongs_to :manufacturer
  has_many :auto_options, :dependent => :destroy
  has_many :periods, :through => :auto_options
  has_many :gears, :through => :auto_options   
  has_many :fuels, :through => :auto_options
  has_many :transmissions, :through => :auto_options
  #has_many :mkpp_periods, :through => :auto_period, :source => :period, :class_name => "Period", :conditions => 'ato_periods.transmission = "mkpp"'

  def to_label
    manufacturer.to_s + " - " + title
  end

  #validates :manufacturer, :presence => true


end
