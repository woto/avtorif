class CreateMdbImports < ActiveRecord::Migration
  def self.up
    create_table :mdb_imports do |t|
      t.string :table_name

      t.timestamps
    end
  end

  def self.down
    drop_table :mdb_imports
  end
end
