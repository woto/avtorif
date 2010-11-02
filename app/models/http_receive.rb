class HttpReceive < ActiveRecord::Base
  has_many :receive_job, :as => :receiveable
  
  def identify_string
      credentials = "#{login}:#{password}@" if login or password
    "http://#{server}:#{port}#{path}"
  end
end
