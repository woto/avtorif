class CreateImportXls < ActiveRecord::Migration
  def self.up
    create_table :import_xls do |t|
      t.string :sheet_number
      t.integer :start_from_line

      t.timestamps
    end
  end

  def self.down
    drop_table :import_xls
  end
end
