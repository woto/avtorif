class ImportJobable < AbstractJobber
  def perform
    unless @jobable.importable.blank?
      importer_class = (@jobable.importable.type.to_s.split(/Import/).first + "Importer").classify.constantize
      importer = importer_class.new(@job, @jobable, @jobable.importable, @optional)
      self.optional = importer.import
    end

    case @jobable.import_method.title
      when /_B_/
        Price.connection.execute("DELETE FROM prices WHERE job_id = #{@job.id}")
        
      when /_I_/
        Вставка
      when /_U_/

      when /_U0_/
        
    end

    super
  end
end