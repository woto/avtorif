class AbstractImporter
  def initialize(job, jobable, importer, optional = nil)
    @job = job
    @jobable = jobable
    @importer = importer
    @optional = optional
  end

  def import
    raise Exception
  end
end