class CreateTransmissions < ActiveRecord::Migration
  def self.up
    create_table :transmissions do |t|
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :transmissions
  end
end
