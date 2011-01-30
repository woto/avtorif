class ChangeWeightGramsColumnType < ActiveRecord::Migration
  def self.up
    change_table :price_import_templates do |t|
      t.change :weight_grams, :integer
    end

    change_table :price_cost_templates do |t|
      t.change :weight_grams, :integer
    end

    change_table :price_catalog_templates do |t|
      t.change :weight_grams, :integer
    end
  end

  def self.down
  end
end
