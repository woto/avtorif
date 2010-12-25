class AddPartsOptionsToImportJob < ActiveRecord::Migration
  def self.up
    add_column :import_jobs, :replacement_colnum, :integer
    add_column :import_jobs, :replacement_delimiter, :string
    add_column :import_jobs, :r0_colnum, :integer
    add_column :import_jobs, :r1_colnum, :integer
    add_column :import_jobs, :r2_colnum, :integer
    add_column :import_jobs, :r3_colnum, :integer
    add_column :import_jobs, :r4_colnum, :integer
    add_column :import_jobs, :r5_colnum, :integer
    add_column :import_jobs, :r6_colnum, :integer
    add_column :import_jobs, :r7_colnum, :integer
    add_column :import_jobs, :r8_colnum, :integer
    add_column :import_jobs, :r9_colnum, :integer
    add_column :import_jobs, :weight_koefficient, :float
  end

  def self.down
    remove_column :import_jobs, :weight_koefficient
    remove_column :import_jobs, :r9_colnum
    remove_column :import_jobs, :r8_colnum
    remove_column :import_jobs, :r7_colnum
    remove_column :import_jobs, :r6_colnum
    remove_column :import_jobs, :r5_colnum
    remove_column :import_jobs, :r4_colnum
    remove_column :import_jobs, :r3_colnum
    remove_column :import_jobs, :r2_colnum
    remove_column :import_jobs, :r1_colnum
    remove_column :import_jobs, :r0_colnum
    remove_column :import_jobs, :replacement_delimiter
    remove_column :import_jobs, :replacement_colnum
  end
end
