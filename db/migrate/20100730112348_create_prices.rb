class CreatePrices < ActiveRecord::Migration
  def self.up
    create_table :prices do |t|
      t.string :code
      t.string :title
      t.references :supplier
      t.decimal :margin
      t.boolean :original
      t.string :file_mask
      t.integer :receive_id
      t.string :receive_type

      t.timestamps
    end
  end

  def self.down
    drop_table :prices
  end
end
