class CreateFolderSettings < ActiveRecord::Migration
  def self.up
    create_table :folder_settings do |t|
      t.string :path

      t.timestamps
    end
  end

  def self.down
    drop_table :folder_settings
  end
end
