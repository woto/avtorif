class AddReplacementFieldsToImportJob < ActiveRecord::Migration
  def self.up
    0.upto(79) do |i|
      add_column :import_jobs, "r#{i}_colnum".to_sym, :integer
      add_column :import_jobs, "rm#{i}_colnum".to_sym, :integer
      add_column :import_jobs, "rdm#{i}".to_sym, :string, :limit => 50
      add_column :import_jobs, "rdi#{i}".to_sym, :integer
      add_column :import_jobs, "rde#{i}".to_sym, :string, :limit => 1
    end

    add_column :import_jobs, :activate_replacements, :boolean
  end

  def self.down
    0.upto(79) do |i|
        remove_column :import_jobs, "r#{i}_colnum".to_sym
        remove_column :import_jobs, "rm#{i}_colnum".to_sym
        remove_column :import_jobs, "rdm#{i}".to_sym
        remove_column :import_jobs, "rdi#{i}".to_sym
        remove_column :import_jobs, "rde#{i}".to_sym
    end

    remove_column :import_jobs, :activate_replacements
  end
end
