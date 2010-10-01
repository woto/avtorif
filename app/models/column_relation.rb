class ColumnRelation < ActiveRecord::Base
  belongs_to :import_job
end
