class CreateReceives < ActiveRecord::Migration
  def self.up
    create_table :receives do |t|
      t.references :price
      t.references :receiveable, :polymorphic => true
      t.string :file_mask

      t.timestamps
    end
  end

  def self.down
    drop_table :receives
  end
end
