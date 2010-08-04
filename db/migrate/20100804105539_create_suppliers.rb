class CreateSuppliers < ActiveRecord::Migration
  def self.up
    create_table :suppliers do |t|
      t.string :title
      t.string :inn, :limit => 12
      t.string :kpp, :limit => 9
      t.string :login
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :suppliers
  end
end
