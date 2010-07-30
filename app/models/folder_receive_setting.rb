class FolderReceiveSetting < ActiveRecord::Base
  has_many :prices, :as => :receive_settings, :dependent => :destroy
end
