# encoding: utf-8

class ColumnRelation < ActiveRecord::Base
  belongs_to :import_job
end
