#logger = RAILS_DEFAULT_LOGGER
#logger.level = Logger::ERROR

class AbstractJobber

  attr_writer :optional
  attr_reader :optional

  def failure(job)
    # https://github.com/collectiveidea/delayed_job hooks
  end

  def initialize(job, jobable, priority, optional = nil)
    @job = job
    @jobable = jobable
    @optional = optional
    @priority = priority
    puts job.title + ' от ' + job.supplier.title
  end

  def perform
    #job = @jobable.job
    @job.last_finish = Time.zone.now
    @job.locked = false
    @job.save

    #TODO Тут сделать вызов либо at_once, либо one_by_one 
    @job.childs.active.each do |job|
      #debugger
      if @optional.size > 0
        JobWalker.new.start_job(job, @priority, @optional)
      end
    end

    puts "Завершили выполнение " + @job.title + " от " + @job.supplier.title
    
  end
end
