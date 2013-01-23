class CreateProgressiveCosts < ActiveRecord::Migration
  def self.up
    create_table :progressive_costs do |t|
      t.integer :min
      t.integer :max
      t.float :percent

      t.timestamps
    end
  end

  def self.down
    drop_table :progressive_costs
  end
end
