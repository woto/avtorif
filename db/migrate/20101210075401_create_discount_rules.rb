class CreateDiscountRules < ActiveRecord::Migration
  def self.up
    create_table :discount_rules do |t|
      t.references :job
      t.boolean :buy_sell
      t.integer :rate
      t.references :discount_group

      t.timestamps
    end
  end

  def self.down
    drop_table :discount_rules
  end
end
