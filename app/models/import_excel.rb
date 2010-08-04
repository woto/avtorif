class ImportExcel < ActiveRecord::Base
  has_one :import_job, :as => :importable
end
