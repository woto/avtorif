class FtpReceive < ActiveRecord::Base
  has_many :receive_job, :as => :receiveable
  accepts_nested_attributes_for :receive_job
  enum_attr :encoding, ['^utf8' ,'cp1251', 'koi8-r', 'cp866'], :nil => true

  def identify_string
    "ftp://#{login}:#{password}@#{server}:#{port}#{path}"
  end

  validates :path, :presence => true
  validates :port, :numericality => {:only_integer => true}
  validates :server, :presence => true
  before_save :remove_leading_ftp

  def remove_leading_ftp
    self.server = self.server.to_s.gsub(/^ftp*:\/\//, '')
  end

  before_save :check_trailing_slashes

  def check_trailing_slashes
    self.path = self.path.to_s.gsub(/^\/*/,'').gsub(/\/*$/,'').insert(0,'/').insert(-1,'/').gsub(/^\/\/$/, '/')
  end

  validates :login, :presence => true

end
