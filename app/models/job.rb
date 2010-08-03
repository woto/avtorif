class Job < ActiveRecord::Base
  has_and_belongs_to_many :repeats

  belongs_to :jobable, :polymorphic => true
  has_one :child, :class_name => "Job", :foreign_key => "job_id"
  belongs_to :parent, :class_name => "Job", :foreign_key => "job_id"
  #has_one :child_job, :foreign_key => :job_id, :class_name => "Job"
  #belongs_to :parent_job, :readonly => true, :foreign_key => :job_id, :class_name => "Job"

  def after_save
    jw = JobWalker.new
    self.next_start = Time.now - 1
    jw.update_next_start self
    #self.save
  end
end
