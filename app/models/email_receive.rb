class EmailReceive < ActiveRecord::Base
  has_many :receive_job, :as => :receiveable
end
