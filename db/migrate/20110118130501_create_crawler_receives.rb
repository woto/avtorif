class CreateCrawlerReceives < ActiveRecord::Migration
  def self.up
    create_table :crawler_receives do |t|
      t.text :instructions

      t.timestamps
    end
  end

  def self.down
    drop_table :crawler_receives
  end
end
