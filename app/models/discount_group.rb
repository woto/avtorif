class DiscountGroup < ActiveRecord::Base
  has_many :suppliers
  has_many :discount_rules

  def to_s
    title
  end
end
