class Repeat < ActiveRecord::Base
  has_and_belongs_to_many :jobs
  validates_uniqueness_of :cron_string
  validates_format_of :cron_string, :with => /^\s*([\*0-9\/,-]+[\ ]+){4,5}([\*0-9\/,-])\s*$/
end