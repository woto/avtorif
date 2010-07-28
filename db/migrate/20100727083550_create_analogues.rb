class CreateAnalogues < ActiveRecord::Migration
  def self.up
    create_table :analogues do |t|
      t.integer :original_id
      t.integer :analogue_id
      t.string :note

      t.timestamps
    end
  end

  def self.down
    drop_table :analogues
  end
end
