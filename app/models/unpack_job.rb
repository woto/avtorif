class UnpackJob < ActiveRecord::Base
  has_many :job, :as => :jobable  
end