class FilterJob < ActiveRecord::Base
  has_many :jobs, :as => :jobable
end
