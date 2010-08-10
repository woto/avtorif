class CreateImportExcels < ActiveRecord::Migration
  def self.up
    create_table :import_excels do |t|
      t.string :sheet_number
      t.string :start_from_line
      t.timestamps
    end
  end

  def self.down
    drop_table :import_excels
  end
end
