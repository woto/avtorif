class CreateCsvImports < ActiveRecord::Migration
  def self.up
    create_table :csv_imports do |t|
      t.string :columns_terminator
      t.string :columns_enclosures
      t.string :columns_escape
      t.integer :start_from_line
      t.string :lines_terminator

      t.timestamps
    end
  end

  def self.down
    drop_table :csv_imports
  end
end
