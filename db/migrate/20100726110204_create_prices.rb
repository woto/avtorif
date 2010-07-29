class CreatePrices < ActiveRecord::Migration
  def self.up
    create_table :prices do |t|
      t.string :code
      t.string :file_mask
      t.references :contractor
      t.decimal :margin
      t.boolean :original
      t.string :filename
      t.integer :settings_id
      t.string :settings_type

      t.timestamps
    end
  end

  def self.down
    drop_table :prices
  end
end
