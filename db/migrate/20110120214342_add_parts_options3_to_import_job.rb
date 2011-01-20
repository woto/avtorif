class AddPartsOptions3ToImportJob < ActiveRecord::Migration
  def self.up
    add_column :import_jobs, :rm1_colnum, :integer
    add_column :import_jobs, :rm2_colnum, :integer
    add_column :import_jobs, :rm3_colnum, :integer
    add_column :import_jobs, :rm4_colnum, :integer
    add_column :import_jobs, :rm5_colnum, :integer
    add_column :import_jobs, :rm6_colnum, :integer
    add_column :import_jobs, :rm7_colnum, :integer
    add_column :import_jobs, :rm8_colnum, :integer
    add_column :import_jobs, :rm9_colnum, :integer
    add_column :import_jobs, :rm0_colnum, :integer
    add_column :import_jobs, :rdm1, :string
    add_column :import_jobs, :rdm2, :string
    add_column :import_jobs, :rdm3, :string
    add_column :import_jobs, :rdm4, :string
    add_column :import_jobs, :rdm5, :string
    add_column :import_jobs, :rdm6, :string
    add_column :import_jobs, :rdm7, :string
    add_column :import_jobs, :rdm8, :string
    add_column :import_jobs, :rdm9, :string
    add_column :import_jobs, :rdm0, :string
    add_column :import_jobs, :ar_colnum, :integer
    add_column :import_jobs, :arm_colnum, :integer
    add_column :import_jobs, :ardm, :string
    add_column :import_jobs, :ar_delimiter, :string
  end

  def self.down
    remove_column :import_jobs, :ar_delimiter
    remove_column :import_jobs, :ardm
    remove_column :import_jobs, :arm_colnum
    remove_column :import_jobs, :ar_colnum
    remove_column :import_jobs, :rdm0
    remove_column :import_jobs, :rdm9
    remove_column :import_jobs, :rdm8
    remove_column :import_jobs, :rdm7
    remove_column :import_jobs, :rdm6
    remove_column :import_jobs, :rdm5
    remove_column :import_jobs, :rdm4
    remove_column :import_jobs, :rdm3
    remove_column :import_jobs, :rdm2
    remove_column :import_jobs, :rdm1
    remove_column :import_jobs, :rm0_colnum
    remove_column :import_jobs, :rm9_colnum
    remove_column :import_jobs, :rm8_colnum
    remove_column :import_jobs, :rm7_colnum
    remove_column :import_jobs, :rm6_colnum
    remove_column :import_jobs, :rm5_colnum
    remove_column :import_jobs, :rm4_colnum
    remove_column :import_jobs, :rm3_colnum
    remove_column :import_jobs, :rm2_colnum
    remove_column :import_jobs, :rm1_colnum
  end
end
