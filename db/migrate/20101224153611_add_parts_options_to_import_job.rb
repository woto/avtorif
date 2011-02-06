class AddPartsOptionsToImportJob < ActiveRecord::Migration
  def self.up
    add_column :import_jobs, :replacement_colnum, :integer
    add_column :import_jobs, :replacement_delimiter, :string
    add_column :import_jobs, :weight_coefficient, :float
  end

  def self.down
    remove_column :import_jobs, :weight_coefficient
    remove_column :import_jobs, :replacement_delimiter
    remove_column :import_jobs, :replacement_colnum
  end
end
