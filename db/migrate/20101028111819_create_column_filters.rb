class CreateColumnFilters < ActiveRecord::Migration
  def self.up
    create_table :column_filters do |t|
      t.string :first
      t.string :second
      t.string :third
      t.string :fourth
      t.string :fifth
      t.string :sixth
      t.string :seventh
      t.string :eighth
      t.string :ninth
      t.string :tenth

      t.timestamps
    end
  end

  def self.down
    drop_table :column_filters
  end
end
