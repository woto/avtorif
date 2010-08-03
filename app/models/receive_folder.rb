class ReceiveFolder < ActiveRecord::Base
  has_one :receive, :as => :receiveable
end
