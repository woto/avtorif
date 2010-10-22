class HttpReceive < ActiveRecord::Base

  def identify_string
      credentials = "#{login}:#{password}@" if login or password
    "http://#{server}:#{port}#{path}"
  end
end
