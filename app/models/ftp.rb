class Ftp < ActiveRecord::Base
  has_many :prices, :as => :receive, :dependent => :destroy
end
