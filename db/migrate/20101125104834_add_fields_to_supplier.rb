class AddFieldsToSupplier < ActiveRecord::Migration
  def self.up
    add_column :suppliers, :title_short, :string
    add_column :suppliers, :title_en, :string
    add_column :suppliers, :title_full, :string
    add_column :suppliers, :okpo, :string
    add_column :suppliers, :okato, :string
    add_column :suppliers, :ogrn, :string
    add_column :suppliers, :legal_address, :string
    add_column :suppliers, :actual_address, :string
    add_column :suppliers, :bik_bank, :string
    add_column :suppliers, :bank_title, :string
    add_column :suppliers, :current_account, :string
    add_column :suppliers, :correspondent_account, :string
    add_column :suppliers, :buyer, :string
    add_column :suppliers, :seller, :string
    add_column :suppliers, :contract, :string
    add_column :suppliers, :fio_head, :string
    add_column :suppliers, :position_head, :string
    add_column :suppliers, :fio_buh, :string
    add_column :suppliers, :phone, :string
    add_column :suppliers, :fax, :string
    add_column :suppliers, :email, :string
    add_column :suppliers, :emaildocs, :string
  end

  def self.down
    remove_column :suppliers, :emaildocs
    remove_column :suppliers, :email
    remove_column :suppliers, :fax
    remove_column :suppliers, :phone
    remove_column :suppliers, :fio_buh
    remove_column :suppliers, :position_head
    remove_column :suppliers, :fio_head
    remove_column :suppliers, :contract
    remove_column :suppliers, :seller
    remove_column :suppliers, :buyer
    remove_column :suppliers, :correspondent_account
    remove_column :suppliers, :current_account
    remove_column :suppliers, :bank_title
    remove_column :suppliers, :bik_bank
    remove_column :suppliers, :actual_address
    remove_column :suppliers, :legal_address
    remove_column :suppliers, :ogrn
    remove_column :suppliers, :okato
    remove_column :suppliers, :okpo
    remove_column :suppliers, :title_full
    remove_column :suppliers, :title_en
    remove_column :suppliers, :title_short
  end
end
