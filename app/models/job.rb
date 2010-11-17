class Job < ActiveRecord::Base

  has_many :supplier_prices, :dependent => :destroy
  
  validates_numericality_of :seconds_between_jobs, :only_integer => true, :if => "!seconds_between_jobs.blank?" 
  validates_numericality_of :seconds_working, :only_integer => true, :if => "!seconds_working.blank?"
  validates_presence_of :title
  validates_presence_of :file_mask
  
  module Status
    START_FAIL = "<div style='background: yellow'>Задача ни разу не была запущена</div><br/>"
    FINISH_FAIL = "<div style='background: yellow'>Задача никогда не завершалась успешно</div><br/>"
    SECONDS_BETWEEN_JOBS_FAIL = "<div style='background: red'>Помещение в очередь не осуществилось в установленный срок</div><br/>"
    SECONDS_WORKING_FAIL = "<div style='background: red'>Выполнение задачи не уложилось в установленный срок</div><br/>"
    NOT_OK = "<div style='background: red'>Дочерние задачи вернули отрицательный статус</div><br/>"
    LOCKED = "<div>Находится в очереди на выполнение или выполняется</div><br/>"
    NOT_OBSERVED = "<div>Не наблюдается</div><br/>"
    OK = "<div>Ок</div><br/>"
    DISABLED = "<div>Отключена</div><br/>"
  end

  cattr_reader :per_page
  @@per_page = 100
  has_many :prices, :dependent => :destroy

  has_and_belongs_to_many :repeats

  #has_one :receive, :as => :receiveable
  #has_one :import, :as => :importable

  belongs_to :supplier
  belongs_to :jobable, :polymorphic => true

  has_many :childs, :class_name => "Job", :foreign_key => "job_id", :dependent => :destroy
  named_scope :active, {:conditions => ["active = ?", 1]}
  
  belongs_to :parent, :class_name => "Job", :foreign_key => "job_id"
  #has_one :child_job, :foreign_key => :job_id, :class_name => "Job"
  #belongs_to :parent_job, :readonly => true, :foreign_key => :job_id, :class_name => "Job"

  def critical
    if !active
      return Status::DISABLED
    end
    
    if locked
      return Status::LOCKED
    end
    
    if (seconds_between_jobs.blank? || seconds_working.blank?)
      return Status::NOT_OBSERVED
    end

    # Если задача еще ниразу не сработала
    if !last_start
      return Status::START_FAIL
    end

    # Если задача еще ниразу не выполнилась
    if !last_finish
      return Status::FINISH_FAIL
    end

    # проверка на периодичность выполнения задачи
    if (DateTime.now > last_start + seconds_between_jobs.seconds) && !locked
      return Status::SECONDS_BETWEEN_JOBS_FAIL
    end

    # проверка на длительность выполнения
    if (DateTime.now > last_start + seconds_working.seconds) && locked
      return Status::SECONDS_WORKING_FAIL
    end

    if locked
      return Status::LOCKED
    end

    return Status::OK

    
  end
  
=begin
  def after_save
    jw = JobWalker.new
    self.next_start = Time.now - 1
    jw.update_next_start self
    #self.save
  end
end
=end

end


public

def critical_tree(job)
  if !defined?(@critical_tree)
    @critical_tree = Array.new
  end

  if job.childs.count > 0
    job.childs.active.each do |ch|
      @critical_tree << ch.critical
      return critical_tree(ch)
    end
  else
    @critical_tree << job.critical
  end

   z = (@critical_tree.dup).uniq
   @critical_tree = Array.new
   (z.size > 1) ? z - [Job::Status::NOT_OBSERVED, Job::Status::DISABLED] : z
end
