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

ActiveRecord::Schema.define(:version => 20100809111859) do

  create_table "analogues", :force => true do |t|
    t.integer  "original_id"
    t.integer  "analogue_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attachments", :force => true do |t|
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.string   "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.string   "md5"
    t.boolean  "proceded",                :default => false
    t.integer  "supplier_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["attachment_file_name", "attachment_file_size", "md5", "supplier_id"], :name => "uniq_attachments", :unique => true

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

  create_table "goods", :force => true do |t|
    t.string   "catalog_number"
    t.integer  "manufacturer_id"
    t.boolean  "original"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "import_csvs", :force => true do |t|
    t.integer  "start_from_line"
    t.string   "delimeter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "import_excels", :force => true do |t|
    t.string   "sheet_number"
    t.string   "start_from_line"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "import_jobs", :force => true do |t|
    t.integer  "importable_id"
    t.string   "importable_type"
    t.integer  "cost_colnum"
    t.integer  "manufacturer_colnum"
    t.integer  "catalog_number_colnum"
    t.integer  "replacement_colnum"
    t.integer  "title_colnum"
    t.integer  "count_colnum"
    t.decimal  "margin",                :precision => 10, :scale => 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", :force => true do |t|
    t.datetime "next_start"
    t.datetime "last_start"
    t.string   "title"
    t.integer  "job_id"
    t.integer  "jobable_id"
    t.string   "jobable_type"
    t.integer  "supplier_id"
    t.string   "file_mask"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "prices", :force => true do |t|
    t.integer  "goods_id"
    t.integer  "supplier_id"
    t.string   "title"
    t.decimal  "cost",        :precision => 10, :scale => 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receive_emails", :force => true do |t|
    t.string   "server"
    t.string   "address"
    t.string   "login"
    t.string   "password"
    t.string   "topic"
    t.string   "sender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receive_folders", :force => true do |t|
    t.string   "path"
    t.string   "login"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receive_ftps", :force => true do |t|
    t.string   "server"
    t.string   "port"
    t.string   "path"
    t.string   "login"
    t.string   "password"
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

  create_table "suppliers", :force => true do |t|
    t.string   "title"
    t.string   "inn",        :limit => 12
    t.string   "kpp",        :limit => 9
    t.string   "login"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
