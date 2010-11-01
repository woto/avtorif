class ImportJob < ActiveRecord::Base
  enum_attr :encoding, %w(utf8 cp1251 koi8-r cp866)
  enum_attr :import_method, ["Имеющиеся в бд очищаем, имеющиеся в прайсе вставляем - B",
                             "Имеющиеся в бд и в прайсе обновляем, имеющиеся в прайсе и отсутствующие в бд вставляем - U ",
                             "Имеющиеся в бд и в прайсе обновляем, имеющиеся в прайсе и отсутствующие в бд не вставляем - U0",
                             "Имеющиеся в бд и в прайсе не трогаем, имеющиеся в прайсе и отсутствующие в бд вставляем"]

  belongs_to :importable, :polymorphic => true
  has_many :job, :as => :jobable
  has_many :column_relations
  has_many :column_filters
  belongs_to :currency_buy, :class_name => 'Currency'
  belongs_to :currency_sell, :class_name => 'Currency'
  belongs_to :currency_weight, :class_name => 'Currency'
  belongs_to :delivery_type
end
