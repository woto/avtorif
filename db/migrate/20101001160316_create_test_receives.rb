class CreateTestReceives < ActiveRecord::Migration
  def self.up
    create_table :test_receives do |t|
      t.string :field

      t.timestamps
    end
  end

  def self.down
    drop_table :test_receives
  end
end
