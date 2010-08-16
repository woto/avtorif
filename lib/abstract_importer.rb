class AbstractImporter
  def initialize(importer, optional = nil)
    @importer = importer
    @optional = optional
  end

  def import
    raise Exception
  end
end