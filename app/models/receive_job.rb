class ReceiveJob < ActiveRecord::Base
  belongs_to :price
  has_one :job, :as => :jobable
end
