class CreatePriceCostTemplates < ActiveRecord::Migration
  def self.up
    create_table :price_cost_templates do |t|
      t.references :job
      t.string :title
      t.string :title_en
      t.integer :count
      t.decimal :price_cost, :precision => 10, :scale => 3
      t.string :manufacturer, :limit => AppConfig.manufacturer_len
      t.string :manufacturer_orig, :limit => AppConfig.manufacturer_len
      t.string :catalog_number, :limit => AppConfig.catalog_number_len
      t.string :catalog_number_orig, :limit => AppConfig.catalog_number_len
      t.string :country
      t.string :parts_group
      t.references :supplier
      t.integer :price_setting_id
      t.integer :processed
      t.string :delivery_days_price
      t.integer :weight_grams
      t.string :external_id
      t.string :unit_package
      t.string :multiply_factor
      t.string :min_order
      t.string :description
      t.string :unit
      t.string :applicability
      t.string :success_percent

      t.timestamps
    end

      add_index :price_cost_templates, :price_setting_id
      add_index :price_cost_templates, [:catalog_number, :manufacturer]

  end

  def self.down
    drop_table :price_cost_templates
  end
end
