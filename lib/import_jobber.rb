class ImportJobber < AbstractJobber
  def perform
    concrete_import = @jobber.importable
    importer_class = (@jobber.importable_type.split(/(.*?)Import/)[2] + "Importer").classify.constantize
    importer = importer_class.new(concrete_import, @optional)
    importer.import
    super
  end
end