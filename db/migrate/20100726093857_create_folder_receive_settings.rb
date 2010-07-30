class CreateFolderReceiveSettings < ActiveRecord::Migration
  def self.up
    create_table :folder_receive_settings do |t|
      t.string :path
      t.string :login
      t.string :password
      t.string :file_date_time      
      
      t.timestamps
    end
  end

  def self.down
    drop_table :folder_receive_settings
  end
end
