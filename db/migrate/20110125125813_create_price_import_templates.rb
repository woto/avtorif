class CreatePriceImportTemplates < ActiveRecord::Migration
  def self.up
    create_table :price_import_templates do |t|
      t.references :job
      t.string :title
      t.string :title_en
      t.integer :count
      t.decimal :price_cost
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
      1.upto(79) do |i|
        eval("t.string :r#{i}, :limit => 20")
        eval("t.string :rm#{i}, :limit => 20")
      end
      t.timestamps
    end
  end

  def self.down
    drop_table :price_import_templates
  end
end
