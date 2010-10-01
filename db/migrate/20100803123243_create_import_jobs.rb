class CreateImportJobs < ActiveRecord::Migration
  def self.up
    create_table :import_jobs do |t|
      #t.references :price
      t.references :importable, :polymorphic => true
      t.timestamps
      t.string :encoding
      t.references :import_method
    end
  end

  def self.down
    drop_table :import_jobs
  end
end
