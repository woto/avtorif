class AddJobIdToManufacturerSynonym < ActiveRecord::Migration
  def self.up
    add_column :manufacturer_synonyms, :job_id, :integer
  end

  def self.down
    remove_column :manufacturer_synonyms, :job_id
  end
end
