class Price < ActiveRecord::Base
  belongs_to :goods
  belongs_to :job
  belongs_to :supplier

  def income_cost
    price_cost * job.import_job.income_rate
  end  

  def retail_cost
    income_cost * job.import_job.retail_rate
  end

end
