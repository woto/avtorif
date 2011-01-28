class RemoveActivateReplacementsFromImportJob < ActiveRecord::Migration
  def self.up
    remove_column :import_jobs, :activate_replacements
  end

  def self.down
    add_column :import_jobs, :activate_replacements, :remove
  end
end
