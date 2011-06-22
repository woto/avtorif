# encoding: utf-8

class SmbReceive < ActiveRecord::Base
  has_many :receive_job, :as => :receiveable

  def identify_string
    "smb://#{server}/#{share}/#{path} - #{login} - #{password} - #{workgroup} - #{port}"
  end
end
