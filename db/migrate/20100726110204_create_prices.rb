class CreatePrices < ActiveRecord::Migration
  def self.up
    create_table :prices do |t|
      t.string :code
      t.string :name
      t.references :contractor
      t.decimal :margin
      t.boolean :original
      t.string :username
      t.string :password
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
