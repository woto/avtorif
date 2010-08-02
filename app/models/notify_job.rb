class NotifyJob < ActiveRecord::Base
  has_one :job, :as => :jobable  
end
