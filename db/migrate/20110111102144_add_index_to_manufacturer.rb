class AddIndexToManufacturer < ActiveRecord::Migration
  def self.up
    change_table :manufacturers do |t|
      t.index :title
    end
  end

  def self.down
  end
end
