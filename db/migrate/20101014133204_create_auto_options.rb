class CreateAutoOptions < ActiveRecord::Migration
  def self.up
    create_table :auto_options do |t|
      t.references :auto
      t.references :period
      t.references :transmission
      t.references :gear
      t.references :fuel

      t.timestamps
    end
  end

  def self.down
    drop_table :auto_options
  end
end
