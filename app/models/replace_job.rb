class ReplaceJob < ActiveRecord::Base
  validates_presence_of :catalog_number_colnum
  has_many :jobs, :as => :jobable  
  validates :weight_coefficient, :numericality => true, :presence => true, :if => Proc.new{|replacement_job| replacement_job.weight_grams_colnum.present?}
  validates :weight_grams_colnum, :numericality => {:only_integer => true}, :allow_nil => true


  for j in 0...AppConfig.max_replaces do
    eval "validates :r#{j}_colnum, :numericality => {:only_integer => true}, :allow_nil => true"
    eval "validates :rdi#{j}, :inclusion => {:in => [1,2,3]}, :if => Proc.new{|replacement_job| replacement_job.r#{j}_colnum.present?}"
    eval "validates :rde#{j}, :length => {:minimum => 0, :maximum => 10}"
  end
end
