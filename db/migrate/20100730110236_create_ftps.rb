class CreateFtps < ActiveRecord::Migration
  def self.up
    create_table :ftps do |t|
      t.string :server
      t.string :path
      t.string :login
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :ftps
  end
end