class Supplier < ActiveRecord::Base
  has_many :jobs, :dependent => :destroy
  validates_length_of :inn, :maximum=>12
  validates_length_of :kpp, :maximum=>9
  has_many :attachments
  has_many :prices

  def status
#    Job.all
#    zzz = jobs.scoped(:joins => "left join receive_jobs on receive_jobs.id = jobs.id", :conditions => {:jobable_type => 'ReceiveJob'})
#    zzz.each.map do |job|
#      SupplierPrice.find(:all, :conditions => {:job_id => job.id})
#    end
  end
end
