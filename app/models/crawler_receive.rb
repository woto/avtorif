class CrawlerReceive < ActiveRecord::Base
  has_many :receive_job, :as => :receiveable
  def identify_string
    "Инструкция паука: " + self.id.to_s
  end
end
