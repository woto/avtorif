class CreateColumnRelations < ActiveRecord::Migration
  def self.up
    create_table :column_relations do |t|
      t.integer :catalog_number
      t.integer :manufacturer
      t.integer :cost
      t.integer :title
      t.integer :weight
      t.integer :count

      t.timestamps
    end
  end

  def self.down
    drop_table :column_relations
  end
end
