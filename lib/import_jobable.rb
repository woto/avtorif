class ImportJobable < AbstractJobber
  def perform
    unless @jobable.importable.blank?
      importer_class = (@jobable.importable.type.to_s.split(/Import/).first + "Importer").classify.constantize
      importer = importer_class.new(@job, @jobable, @jobable.importable, @optional)
      self.optional = importer.import
    end

    case @jobable.import_method.try(:title)
      when 'clear_by_supplier'
        Price.connection.execute("DELETE FROM prices WHERE supplier_id = #{@job.supplier.id}")
      when 'clear_by_filters'
        Price.connection.execute("DELETE FROM prices WHERE ")
      when 'simple_insert'
        raise 'hehey'
    end

    super
  end
end