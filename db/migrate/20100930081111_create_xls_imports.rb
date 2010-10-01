class CreateXlsImports < ActiveRecord::Migration
  def self.up
    create_table :xls_imports do |t|
      t.integer :sheet_number
      t.string :sheet_name
      t.integer :start_from_line

      t.timestamps
    end
  end

  def self.down
    drop_table :xls_imports
  end
end
