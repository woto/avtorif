class CreateRepeats < ActiveRecord::Migration
  def self.up
    create_table :repeats do |t|
      t.string :minute
      t.string :hour
      t.string :day
      t.string :month
      t.string :year
      t.string :weekday
      t.boolean :active
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :repeats
  end
end
