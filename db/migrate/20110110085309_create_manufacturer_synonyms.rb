class CreateManufacturerSynonyms < ActiveRecord::Migration
  def self.up
    create_table :manufacturer_synonyms do |t|
      t.belongs_to :manufacturer
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :manufacturer_synonyms
  end
end
