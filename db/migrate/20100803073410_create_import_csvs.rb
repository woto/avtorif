class CreateImportCsvs < ActiveRecord::Migration
  def self.up
    create_table :import_csvs do |t|
      t.integer :start_from_line
      t.string :delimeter
      t.string :codepage
      t.timestamps
    end
  end

  def self.down
    drop_table :import_csvs
  end
end
