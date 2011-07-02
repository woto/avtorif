class AddMinimalIncomeCostToPriceCostTemplates < ActiveRecord::Migration
  def self.up
    add_column :price_cost_templates, :minimal_income_cost, :float
  end

  def self.down
    remove_column :price_cost_templates, :minimal_income_cost
  end
end
