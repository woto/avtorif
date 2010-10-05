class CreateFolderReceives < ActiveRecord::Migration
  def self.up
    create_table :folder_receives do |t|
      t.string :path

      t.timestamps
    end
  end

  def self.down
    drop_table :folder_receives
  end
end
