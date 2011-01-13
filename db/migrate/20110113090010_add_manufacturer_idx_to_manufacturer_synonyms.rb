class AddManufacturerIdxToManufacturerSynonyms < ActiveRecord::Migration
  def self.up
    change_table :manufacturer_synonyms do |t|
      t.index :manufacturer_id
    end
  end

  def self.down
  end
end
