class HttpReceive < ActiveRecord::Base
  has_many :receive_job, :as => :receiveable
  enum_attr :encoding, ['^utf8' ,'cp1251', 'koi8-r', 'cp866']
  
  def identify_string
      credentials = "#{login}:#{password}@" if login or password
    "http://#{server}:#{port}#{path}"
  end
end
