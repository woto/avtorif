class Attachment < ActiveRecord::Base
  has_attached_file :attachment
  belongs_to :supplier
end
