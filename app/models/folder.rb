class Folder < ActiveRecord::Base
  has_one :receive, :as => :receiveable, :dependent => :destroy
end
