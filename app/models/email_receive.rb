# encoding: utf-8

class EmailReceive < ActiveRecord::Base
  has_many :receive_job, :as => :receiveable

  def identify_string
    "#{server} - #{port} - #{login} - #{password} - #{ssl}"
  end
end
