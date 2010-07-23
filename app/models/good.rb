class Good < ActiveRecord::Base
  belongs_to :price
  belongs_to :manufacturer
  belongs_to :contractor
end
