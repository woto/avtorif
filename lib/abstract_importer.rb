class AbstractImporter
  def initialize(importer)
    @importer = importer
  end

  def import
    raise Exception
  end
end