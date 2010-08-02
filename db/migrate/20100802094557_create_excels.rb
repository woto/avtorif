class CreateExcels < ActiveRecord::Migration
  def self.up
    create_table :excels do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :excels
  end
end
