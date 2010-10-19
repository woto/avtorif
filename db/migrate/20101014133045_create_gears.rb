class CreateGears < ActiveRecord::Migration
  def self.up
    create_table :gears do |t|
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :gears
  end
end
