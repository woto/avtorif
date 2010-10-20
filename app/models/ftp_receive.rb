class FtpReceive < ActiveRecord::Base
  has_many :receive_job, :as => :receiveable
  accepts_nested_attributes_for :receive_job
end
