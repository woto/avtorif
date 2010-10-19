class CreatePeriods < ActiveRecord::Migration
  def self.up
    create_table :periods do |t|
      t.integer :thousand_kilometers
      t.integer :months

      t.timestamps
    end
  end

  def self.down
    drop_table :periods
  end
end
