class Excel < ActiveRecord::Base
  has_one :import, :as => :importable, :dependent => :destroy  
end
