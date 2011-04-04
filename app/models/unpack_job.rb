class UnpackJob < ActiveRecord::Base
  has_many :jobs, :as => :jobable  
  enum_attr :archive_type, %w(rar zip), :nil => true
end
