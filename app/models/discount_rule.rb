class DiscountRule < ActiveRecord::Base
  belongs_to :job
  belongs_to :discount_group
  belongs_to :import_job, :foreign_key => 'job_id', :conditions => "jobs.jobable_type = 'ImportJob'", :class_name => "Job"
end
