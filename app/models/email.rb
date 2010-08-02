class Email < ActiveRecord::Base
  has_one :receive, :as => :receiveable, :dependent => :destroy  
end
