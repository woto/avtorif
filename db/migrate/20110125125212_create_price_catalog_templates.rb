class CreatePriceCatalogTemplates < ActiveRecord::Migration
  def self.up
    create_table :price_catalog_templates do |t|
      t.references :job
      t.string :manufacturer
      t.string :catalog_number
      t.decimal :weight_grams
      0.upto(79) do |i|
        eval("t.string :r#{i}, :limit => 20")
        eval("t.string :rm#{i}, :limit => 20")
      end
      t.string :new_catalog_number
      t.timestamps
    end
  end

  def self.down
    drop_table :price_catalog_templates
  end
end
