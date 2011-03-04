class ImportJob < ActiveRecord::Base
  enum_attr :encoding, %w(utf8 cp1251 koi8-r cp866), :nil => true
  enum_attr :import_method, ["Очищаем и вставляем - _B_",
    "Вставляем _I_",
    "Имеющиеся в бд и в прайсе обновляем, имеющиеся в прайсе и отсутствующие в бд вставляем - _U_ ",
    "Имеющиеся в бд и в прайсе обновляем, имеющиеся в прайсе и отсутствующие в бд не вставляем - _U0_"
  ], :nil => true

  belongs_to :importable, :polymorphic => true
  has_many :jobs, :as => :jobable
  belongs_to :delivery_type

  belongs_to :price_setting

  validates_presence_of :import_method
  validates_presence_of :price_setting

  validates_presence_of :income_price_colnum
  validates_presence_of :catalog_number_colnum

  validates_numericality_of :income_rate, :greater_than => 0

  validates_numericality_of :manufacturer_colnum, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 100, :allow_nil => true
  validates_numericality_of :catalog_number_colnum, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 100
  validates_numericality_of :title_colnum, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 100, :allow_nil => true
  validates_numericality_of :count_colnum, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 100, :allow_nil => true
  validates_numericality_of :income_price_colnum, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 100
  validates_numericality_of :external_id_colnum, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 100, :allow_nil => true
  validates_numericality_of :weight_grams_colnum, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 100, :allow_nil => true
end
