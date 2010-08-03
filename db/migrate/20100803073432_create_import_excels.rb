class CreateImportExcels < ActiveRecord::Migration
  def self.up
    create_table :import_excels do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :import_excels
  end
end
