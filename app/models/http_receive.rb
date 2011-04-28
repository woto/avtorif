class HttpReceive < ActiveRecord::Base
  has_many :receive_job, :as => :receiveable
  enum_attr :encoding, ['^utf-8' ,'cp1251', 'koi8-r', 'cp866'], :nil => true
  validates :path, :presence => true
  validates :port, :numericality => {:only_integer => true}
  validates :server, :presence => true

  before_save :remove_leading_http

  def remove_leading_http
    self.server = self.server.to_s.gsub(/^https*:\/\//, '')
  end

  before_save :check_trailing_slashes

  def identify_string
    credentials = "#{login}:#{password}@" if login or password
    "http://#{server}:#{port}#{path}"
  end

  def check_trailing_slashes
    self.path = self.path.to_s.gsub(/^\/*/,'').gsub(/\/*$/,'').insert(0,'/').insert(-1,'/').gsub(/^\/\/$/, '/')
  end

end
