class ChangeWeightColnumToWeightGramsConum < ActiveRecord::Migration
  def self.up
    change_table :import_jobs do |t|
      t.rename :weight_colnum, :weight_grams_colnum
    end
  end

  def self.down
    change_table :import_jobs do |t|
      t.rename :weight_grams_colnum, :weight_colnum
    end
  end
end
