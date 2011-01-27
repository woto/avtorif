class AddReplacementFieldsToImportJob < ActiveRecord::Migration
  def self.up
    0.upto(79) do |i|
      add_column :import_jobs, "r#{i}_colnum".to_sym, :integer
      add_column :import_jobs, "rm#{i}_colnum".to_sym, :integer
      add_column :import_jobs, "rdm#{i}".to_sym, :string, :limit => 50
      add_column :import_jobs, "rd#{i}".to_sym, :integer
    end
 
    add_column :import_jobs, :ar_colnum, :integer
    add_column :import_jobs, :arm_colnum, :integer
    add_column :import_jobs, :ardm, :integer
    add_column :import_jobs, :ard, :integer
    add_column :import_jobs, :ar_delimiter, :string, :limit => 5
  end

  def self.down
    0.upto(79) do |i|
        remove_column :import_jobs, "r#{i}_colnum".to_sym
        remove_column :import_jobs, "rm#{i}_colnum".to_sym
        remove_column :import_jobs, "rdm#{i}".to_sym
        remove_column :import_jobs, "rd#{i}".to_sym
    end

    remove_column :import_jobs, :ar_colnum
    remove_column :import_jobs, :arm_colnum
    remove_column :import_jobs, :ardm
    remove_column :import_jobs, :ard
    remove_column :import_jobs, :ar_delimiter
  end
end
