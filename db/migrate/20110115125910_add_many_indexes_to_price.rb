class AddManyIndexesToPrice < ActiveRecord::Migration
  def self.up
    change_table :prices do |t|
      t.index :job_code
      t.index :job_id
    end
  end

  def self.down
  end
end
