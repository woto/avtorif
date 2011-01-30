class RenameWeightKoefficientToWeightCoefficint < ActiveRecord::Migration
  def self.up
    change_table :import_jobs do |t|
      t.rename :weight_koefficient, :weight_coefficient
    end
  end

  def self.down
    change_table :import_jobs do |t|
      t.rename :weight_coefficient, :weight_koefficient
    end
  end
end
