class Currency < ActiveRecord::Base
  has_many :import_jobs
  #has_many :through_weight, :class_name => 'PriceSetting', :foreign_key => 'currency_weight_id'
  #has_many :through_buy, :class_name => 'PriceSetting', :foreign_key => 'currency_buy_id'
  validates :title, :presence => true
  #validates :foreign_id, :format => {:with => /^[a-z]{3}$/, :message => "код может содержать только три символа латинского алфавита"}
  validates_numericality_of :value, :numericality => true, :presence => true, :greater_than => 0
  has_many :childs, :class_name => "Currency"
  belongs_to :parent, :class_name => "Currency", :foreign_key => "currency_id"
end
