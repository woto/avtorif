class CreateFolders < ActiveRecord::Migration
  def self.up
    create_table :folders do |t|
      t.string :path
      t.string :login
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :folders
  end
end
