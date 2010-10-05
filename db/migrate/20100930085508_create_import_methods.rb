class CreateImportMethods < ActiveRecord::Migration
  def self.up
    create_table :import_methods do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :import_methods
  end
end