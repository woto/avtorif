class CreatePriceCostTemplates < ActiveRecord::Migration
  def self.up
    create_table :price_cost_templates do |t|
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
      t.references :supplier
      t.string :job_code
      t.integer :processed
      t.string :delivery_days_price
      t.decimal :weight_grams
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
  end

  def self.down
    drop_table :price_cost_templates
  end
end
