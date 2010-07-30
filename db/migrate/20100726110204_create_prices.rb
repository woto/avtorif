class CreatePrices < ActiveRecord::Migration
  def self.up
    create_table :prices do |t|
      t.string :code
      t.string :name
      t.references :contractor
      t.decimal :margin
      t.boolean :original
      t.string :file_mask
      t.string :file_hash
      t.integer :receive_settings_id
      t.string :receive_settings_type

      t.timestamps
    end
  end

  def self.down
    drop_table :prices
  end
end
