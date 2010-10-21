class SmbReceive < ActiveRecord::Base
  has_many :receive_job, :as => :receiveable

  def identify_string
    "#{server} - #{share} - #{port} - #{path} - #{login} - #{password} - #{workgroup}"
  end
end
