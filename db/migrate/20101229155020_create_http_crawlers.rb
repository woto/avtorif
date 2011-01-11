class CreateHttpCrawlers < ActiveRecord::Migration
  def self.up
    create_table :http_crawlers do |t|
      t.text :instruction

      t.timestamps
    end
  end

  def self.down
    drop_table :http_crawlers
  end
end
