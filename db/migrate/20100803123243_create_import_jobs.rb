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
      t.decimal :margin, :precision => 10, :scale => 5
      t.string :encoding
      t.integer :estimate_days
      t.string :email_topic
      t.string :email_sender


      t.timestamps
    end
  end

  def self.down
    drop_table :import_jobs
  end
end
