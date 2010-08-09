class CreateImportJobs < ActiveRecord::Migration
  def self.up
    create_table :import_jobs do |t|
      #t.references :price
      t.references :importable, :polymorphic => true
      t.integer :cost_colnum
      t.integer :manufacturer_colnum
      t.integer :catalog_number_colnum
      t.integer :replacement_colnum
      t.integer :cost_colnum
      t.integer :title_colnum
      t.integer :count_colnum
      t.integer :margin


      t.timestamps
    end
  end

  def self.down
    drop_table :import_jobs
  end
end
