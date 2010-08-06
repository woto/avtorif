class Price < ActiveRecord::Base
  belongs_to :goods
  belongs_to :job  
end