class Job < ActiveRecord::Base

  module Status
    START_FAIL = "<div style='background: yellow'>Задача ни разу не была запущена</div>"
    FINISH_FAIL = "<div style='background: yellow'>Задача никогда не завершалась успешно</div>"
    INTERVAL_BETWEEN_JOBS_FAIL = "<div style='background: red'>Помещение в очередь не осуществилось в установленный срок</div>"
    INTERVAL_WORKING_FAIL = "<div style='background: red'>Выполнение задачи не уложилось в установленный срок</div>"
    LOCKED = "Находится в очереди на выполнение или выполняется"
    NOT_OBSERVED = "Не наблюдается"
    OK = "Ок"
  end

  cattr_reader :per_page
  @@per_page = 100
  has_many :prices

  has_and_belongs_to_many :repeats

  #has_one :receive, :as => :receiveable
  #has_one :import, :as => :importable

  belongs_to :supplier
  belongs_to :jobable, :polymorphic => true
  has_many :childs, :class_name => "Job", :foreign_key => "job_id"
  belongs_to :parent, :class_name => "Job", :foreign_key => "job_id"
  #has_one :child_job, :foreign_key => :job_id, :class_name => "Job"
  #belongs_to :parent_job, :readonly => true, :foreign_key => :job_id, :class_name => "Job"

  def critical
    if (interval_between_jobs.blank? || interval_working.blank?)
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
    if (DateTime.now > last_start + interval_between_jobs.seconds) && !locked
      return Status::INTERVAL_BETWEEN_JOBS_FAIL
    end

    # проверка на длительность выполнения
    if (DateTime.now > last_start + interval_working.seconds) && locked
      return Status::INTERVAL_WORKING_FAIL
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
