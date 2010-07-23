class CreateContractors < ActiveRecord::Migration
  def self.up
    create_table :contractors do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :contractors
  end
end
