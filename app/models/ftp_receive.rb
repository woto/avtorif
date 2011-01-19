class FtpReceive < ActiveRecord::Base
  has_many :receive_job, :as => :receiveable
  accepts_nested_attributes_for :receive_job
  enum_attr :encoding, ['^utf8' ,'cp1251', 'koi8-r', 'cp866'], :nil => true

  def identify_string
    "ftp://#{login}:#{password}@#{server}:#{port}#{path}"
  end
end
