class ImportCsv < ActiveRecord::Base
  has_one :import, :as => :importable
end
