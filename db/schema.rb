# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101102154815) do

  create_table "analogues", :force => true do |t|
    t.integer  "original_id"
    t.integer  "analogue_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "auto_options", :force => true do |t|
    t.integer  "auto_id"
    t.integer  "period_id"
    t.integer  "transmission_id"
    t.integer  "gear_id"
    t.integer  "fuel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "autos", :force => true do |t|
    t.integer  "manufacturer_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "column_relations", :force => true do |t|
    t.integer  "catalog_number"
    t.integer  "manufacturer"
    t.integer  "cost"
    t.integer  "title"
    t.integer  "weight"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "convert_jobs", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "convert_method"
  end

  create_table "currencies", :force => true do |t|
    t.string   "title"
    t.string   "foreign_id"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "delivery_types", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_receives", :force => true do |t|
    t.string   "server"
    t.string   "port"
    t.boolean  "ssl"
    t.string   "login"
    t.string   "password"
    t.string   "protocol"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_settings", :force => true do |t|
    t.string   "sender"
    t.string   "topic"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "filter_jobs", :force => true do |t|
    t.string   "first"
    t.string   "second"
    t.string   "third"
    t.string   "fourth"
    t.string   "fifth"
    t.string   "sixth"
    t.string   "seventh"
    t.string   "eighth"
    t.string   "ninth"
    t.string   "tenth"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "col_sep"
  end

  create_table "folder_receives", :force => true do |t|
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ftp_receives", :force => true do |t|
    t.string   "server",     :default => "ftp.avtorif.ru"
    t.integer  "port",       :default => 21
    t.string   "path",       :default => "/"
    t.string   "login",      :default => "anonymous"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fuels", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gears", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goods", :force => true do |t|
    t.string   "catalog_number"
    t.integer  "manufacturer_id"
    t.boolean  "original"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goods_auto_options", :force => true do |t|
    t.integer  "goods_id"
    t.integer  "auto_option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "http_receives", :force => true do |t|
    t.string   "server"
    t.string   "port",       :default => "80"
    t.string   "path"
    t.string   "login"
    t.string   "password"
    t.boolean  "ssl"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "import_jobs", :force => true do |t|
    t.integer  "importable_id"
    t.string   "importable_type"
    t.string   "import_method"
    t.string   "encoding"
    t.boolean  "presence"
    t.integer  "currency_buy_id"
    t.integer  "currency_sell_id"
    t.integer  "currency_weight_id"
    t.integer  "delivery_type_id"
    t.boolean  "visible_for_site"
    t.boolean  "visible_for_stock"
    t.boolean  "visible_for_shops"
    t.integer  "estimate_days"
    t.float    "retail_rate"
    t.float    "income_rate"
    t.float    "kilo_price"
    t.float    "weight_unavaliable_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", :force => true do |t|
    t.datetime "next_start"
    t.datetime "last_start"
    t.datetime "last_finish"
    t.integer  "seconds_between_jobs", :default => 4000
    t.integer  "seconds_working",      :default => 20
    t.string   "title"
    t.integer  "job_id"
    t.integer  "jobable_id"
    t.string   "jobable_type"
    t.integer  "supplier_id"
    t.string   "file_mask"
    t.boolean  "locked",               :default => false
    t.boolean  "active",               :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "job_code"
  end

  create_table "jobs_repeats", :id => false, :force => true do |t|
    t.integer  "repeat_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manufacturers", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mies", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periods", :force => true do |t|
    t.integer  "thousand_kilometers"
    t.integer  "months"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prices", :force => true do |t|
    t.integer  "job_id"
    t.string   "job_title"
    t.integer  "goods_id"
    t.integer  "supplier_id"
    t.string   "supplier"
    t.string   "title"
    t.integer  "count",          :limit => 10, :precision => 10, :scale => 0
    t.decimal  "initial_cost",                 :precision => 10, :scale => 3
    t.decimal  "result_cost",                  :precision => 10, :scale => 3
    t.decimal  "margin",                       :precision => 10, :scale => 3
    t.string   "manufacturer"
    t.string   "catalog_number"
    t.string   "inn",            :limit => 12
    t.string   "kpp",            :limit => 9
    t.integer  "estimate_days"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receive_jobs", :force => true do |t|
    t.integer  "receiveable_id"
    t.string   "receiveable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repeats", :force => true do |t|
    t.string   "cron_string"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "smb_receives", :force => true do |t|
    t.string   "server",     :default => "rif2010"
    t.string   "share"
    t.integer  "port",       :default => 445
    t.string   "path",       :default => "/"
    t.string   "login",      :default => "office"
    t.string   "password",   :default => "2"
    t.string   "workgroup"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supplier_prices", :force => true do |t|
    t.string   "attachment_file_name",    :limit => 50
    t.string   "attachment_content_type"
    t.string   "attachment_file_size",    :limit => 20
    t.datetime "attachment_updated_at"
    t.string   "md5",                     :limit => 50
    t.integer  "supplier_id"
    t.string   "email_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "job_code"
    t.integer  "job_id"
  end

  create_table "suppliers", :force => true do |t|
    t.string   "title"
    t.string   "inn",          :limit => 12
    t.string   "kpp",          :limit => 9
    t.string   "login"
    t.string   "password"
    t.string   "contact_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transmissions", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unpack_jobs", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
