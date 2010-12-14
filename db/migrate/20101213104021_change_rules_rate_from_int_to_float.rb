class ChangeRulesRateFromIntToFloat < ActiveRecord::Migration
  def self.up
    change_table :discount_rules do |t|
      t.change :rate, :float
    end
  end

  def self.down
  end
end
