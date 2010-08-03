class ReceiveEmail < ActiveRecord::Base
  has_one :receive, :as => :receiveable
end
