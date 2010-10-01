class EmailReceive < ActiveRecord::Base
  has_one :receive_job, :as => :receiveable
end
