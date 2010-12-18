class ChangeLastErrorColumnType < ActiveRecord::Migration
  def self.up
    change_table :jobs do |t|
      t.change :last_error, :text
    end
  end

  def self.down
  end
end
