class CreatePriceCatalogTemplates < ActiveRecord::Migration
  def self.up
    create_table :price_catalog_templates do |t|
      t.references :job
      t.string :manufacturer, :limit => AppConfig.manufacturer_len
      t.string :catalog_number, :limit => AppConfig.catalog_number_len
      t.string :title
      t.string :title_en
      t.integer :weight_grams
      0.upto(AppConfig.max_replaces - 1) do |i|
        eval("t.string :r#{i}, :limit => #{AppConfig.catalog_number_len}")
        eval("t.string :rm#{i}, :limit => #{AppConfig.manufacturer_len}")
        eval("t.integer :ra#{i}")
      end
      t.string :new_catalog_number
      t.timestamps
    end

    add_index :price_catalog_templates, [:catalog_number, :manufacturer]

  end

  def self.down
    drop_table :price_catalog_templates
  end
end
