class XlsImport < ActiveRecord::Base
  has_many :import_job, :as => :importable
end
