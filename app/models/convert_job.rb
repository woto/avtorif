class ConvertJob < ActiveRecord::Base
  has_many :job, :as => :jobable  
end
