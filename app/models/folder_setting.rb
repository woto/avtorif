class FolderSetting < ActiveRecord::Base
  has_many :price, :as => :settings, :dependent => :destroy      
end
