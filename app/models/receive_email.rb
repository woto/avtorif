class ReceiveEmail < ActiveRecord::Base
  has_one :receive_job, :as => :receiveable
end
