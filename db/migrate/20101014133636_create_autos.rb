class CreateAutos < ActiveRecord::Migration
  def self.up
    create_table :autos do |t|
      t.references :manufacturer
      t.string :title
      
      t.timestamps
    end
  end

  def self.down
    drop_table :autos
  end
end
