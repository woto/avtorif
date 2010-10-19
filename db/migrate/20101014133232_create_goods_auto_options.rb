class CreateGoodsAutoOptions < ActiveRecord::Migration
  def self.up
    create_table :goods_auto_options do |t|
      t.references :goods
      t.references :auto_option

      t.timestamps
    end
  end

  def self.down
    drop_table :goods_auto_options
  end
end
