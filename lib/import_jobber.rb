class ImportJobber < AbstractJobber
  def perform
    unless @jobber.importable.blank?
      importer_class = (@jobber.importable.type.to_s.split(/Import/).first + "Importer").classify.constantize
      importer = importer_class.new(@jobber.importable, @optional)
      importer.import      
    end

    case @jobber.import_method.title
      when 'clear_by_supplier'
        Price.connection.execute("DELETE FROM prices WHERE supplier_id = #{@jobber.job.supplier.id}")
      when 'clear_by_filters'
        Price.connection.execute("DELETE FROM prices WHERE ")
      when 'simple_insert'
        raise 'hehey'
    end

    super
  end
end