class DelayedJob < ActiveRecord::Base
  belongs_to :job
  self.per_page = 10
end
