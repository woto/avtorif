class AddCurrencyIdToCurrency < ActiveRecord::Migration
  def self.up
    add_column :currencies, :currency_id, :integer
    add_column :currencies, :percent, :float
  end

  def self.down
    remove_column :currencies, :currency_id
    remove_column :currencies, :percent
  end
end
