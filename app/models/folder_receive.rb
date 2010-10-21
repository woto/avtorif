class FolderReceive < ActiveRecord::Base
  has_many :receive_job, :as => :receiveable

  def identify_string
    "#{path}"
  end
end
