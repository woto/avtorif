class CreateReplaceJobs < ActiveRecord::Migration
  def self.up

    create_table :replace_jobs do |t|

      0.upto(AppConfig.max_replaces - 1) do |i|
        t.integer "r#{i}_colnum".to_sym, :limit => AppConfig.catalog_number_len
        t.integer "rm#{i}_colnum".to_sym, :limit => AppConfig.manufacturer_len
        t.string  "rdm#{i}".to_sym, :limit => AppConfig.manufacturer_len
        t.integer "rdi#{i}".to_sym 
        t.string  "rde#{i}".to_sym, :limit => 1
      end
      
      t.integer :catalog_number_colnum
      t.integer :manufacturer_colnum
      t.string :default_manufacturer, :limit => AppConfig.manufacturer_len
      t.integer :weight_grams_colnum
      t.integer :new_catalog_number_colnum
      t.float :weight_coefficient

      t.timestamps
    end
  end

  def self.down
    drop_table :replace_jobs
  end
end
