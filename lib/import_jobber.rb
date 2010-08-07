class ImportJobber < AbstractJobber
  def perform
    RAILS_DEFAULT_LOGGER.warn("xyz")    
  end
end