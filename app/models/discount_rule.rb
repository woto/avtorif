class DiscountRule < ActiveRecord::Base
  belongs_to :job
  belongs_to :discount_group
end
