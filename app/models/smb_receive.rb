class SmbReceive < ActiveRecord::Base
  has_many :receive_job, :as => :receiveable
end