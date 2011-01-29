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
      t.string :catalog_number
      t.string :country
      t.string :parts_group
      t.string :doublet
      t.references :supplier
      t.string :job_code
      t.boolean :processed, {:default => 0}
      t.string :delivery_days_price
      t.decimal :weight_grams
      t.string :external_id
      t.string :unit_package
      t.string :multiply_factor
      t.string :min_order
      t.string :description
      t.string :unit
      t.string :applicability
      0.upto(AppConfig.mar_replaces) do |i|
        eval("t.string :r#{i}, :limit => #{AppConfig.catalog_number_len}")
        eval("t.string :rm#{i}, :limit => #{AppConfig.manufacturer_len}")
        eval("t.integer :rdi#{i}")
      end
      t.timestamps
    end
  end

  def self.down
    drop_table :price_import_templates
  end
end
