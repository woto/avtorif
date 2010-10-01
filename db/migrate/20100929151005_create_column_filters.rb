class CreateColumnFilters < ActiveRecord::Migration
  def self.up
    create_table :column_filters do |t|
      t.string :count
      t.string :cost
      t.string :title
      t.string :catalog_number
      t.string :manufacturer
      t.string :weight
      t.references :import_rules
      t.integer :margin, :precision => 10, :scale => 5
      t.integer :estimate_days

      t.timestamps
    end
  end

  def self.down
    drop_table :column_filters
  end
end
