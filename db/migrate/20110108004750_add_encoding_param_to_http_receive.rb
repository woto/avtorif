class AddEncodingParamToHttpReceive < ActiveRecord::Migration
  def self.up
    add_column :http_receives, :encoding, :string
  end

  def self.down
    remove_column :http_receives, :encoding
  end
end
