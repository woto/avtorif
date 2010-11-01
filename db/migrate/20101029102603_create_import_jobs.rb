class CreateImportJobs < ActiveRecord::Migration
  def self.up
    create_table :import_jobs do |t|
      t.references :importable, :polymorphic => true
      t.enum :import_method
      t.enum :encoding
      t.boolean :presence
      t.references :currency_buy
      t.references :currency_sell
      t.references :currency_weight
      t.references :delivery_type
      t.boolean :visible_for_site
      t.boolean :visible_for_stock
      t.boolean :visible_for_shops
      t.integer :estimate_days
      t.float :retail_rate
      t.float :income_rate
      t.float :kilo_price
      t.float :weight_unavaliable_rate

      t.timestamps
    end
  end

  def self.down
    drop_table :import_jobs
  end
end
