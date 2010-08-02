class CreateRepeats < ActiveRecord::Migration
  def self.up
    create_table :repeats do |t|
      t.string :cron_string
      t.string :title
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :repeats
  end
end
