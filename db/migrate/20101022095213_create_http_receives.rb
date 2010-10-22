class CreateHttpReceives < ActiveRecord::Migration
  def self.up
    create_table :http_receives do |t|
      t.string :server
      t.integer :port
      t.string :path
      t.string :login
      t.string :password
      t.boolean :ssl

      t.timestamps
    end
  end

  def self.down
    drop_table :http_receives
  end
end
