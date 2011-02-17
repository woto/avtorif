class CreatePriceImportTemplates < ActiveRecord::Migration
  def self.up
    create_table :price_import_templates do |t|
      t.references :job
      t.string :title
      t.string :title_en
      t.integer :count
      t.decimal :price_cost, :precision => 10, :scale => 3
      t.string :manufacturer
      t.string :manufacturer_orig
      t.string :catalog_number, :limit => AppConfig.catalog_number_len
      t.string :catalog_number_orig, :limit => AppConfig.catalog_number_len
      t.string :new_catalog_number, :limit => AppConfig.catalog_number_len
      t.string :new_catalog_number_orig, :limit => AppConfig.catalog_number_len
      t.string :country
      t.string :parts_group
      t.string :doublet
      t.references :supplier
      t.integer :price_setting_id
      t.boolean :processed, {:default => 0}
      t.string :delivery_days_price
      t.integer :weight_grams
      t.string :external_id
      t.string :unit_package
      t.string :multiply_factor
      t.string :min_order
      t.string :description
      t.string :unit
      t.string :applicability
      t.string :replacement, :limit => AppConfig.catalog_number_len
      t.string :replacement_orig, :limit => AppConfig.catalog_number_len
      t.string :replacement_manufacturer, :limit => AppConfig.manufacturer_len
      t.string :replacement_manufacturer_orig, :limit => AppConfig.manufacturer_len
      t.timestamps
    end
  end

  def self.down
    drop_table :price_import_templates
  end
end
