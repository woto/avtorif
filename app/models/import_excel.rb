class ImportExcel < ActiveRecord::Base
  has_one :import, :as => :importable
end
