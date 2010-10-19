class CreateFuels < ActiveRecord::Migration
  def self.up
    create_table :fuels do |t|
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :fuels
  end
end
