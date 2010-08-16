class Price < ActiveRecord::Base
  belongs_to :goods
  belongs_to :job
  #belongs_to :supplier
end