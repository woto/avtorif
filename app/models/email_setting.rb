class EmailSetting < ActiveRecord::Base
  has_many :price, :as => :settings, :dependent => :destroy    
end
