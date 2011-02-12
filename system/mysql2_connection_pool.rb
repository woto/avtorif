require 'rubygems'
require 'rails'
require 'mysql2'
require 'mysql2/em'
require 'ruby-debug'

module Rails
  class << self
    def root
      "/home/woto/rails/avtorif/"
    end 

    def env 
      "production"
    end 
  end 
end

class MysqlConnectionPool
  
  def initialize(conf)
    @pool_size = conf[:size] || 100
    @connections = []
    @query_queue = EM::Queue.new
    start_queue conf
  end
  
  def queue_worker_loop
    proc{ |connection|
      @query_queue.pop do |query|
        sql = query[:sql].is_a?(Proc) ? query[:sql].call(connection) : query[:sql]
        connection.query(sql, query[:opts]).callback do |result|
          query[:callback].call result if query[:callback]
          queue_worker_loop.call connection
        end
      end
    }
  end
  
  def start_queue(conf)
    @pool_size.times do
      connection = Mysql2::EM::Client.new(conf)
      @connections << connection
      queue_worker_loop.call connection
    end
  end
  
  def query(sql, opts={}, &block)
    @query_queue.push :sql => sql, :opts => opts, :callback => block
  end
end

mysql_connection = YAML.load_file("#{Rails.root}/config/database.yml")[Rails.env].symbolize_keys

EM.run do
  con = MysqlConnectionPool.new mysql_connection
  
  EM.add_periodic_timer 0.3 do
    first_query = con.query "SELECT sleep(3) as first_query" do |result|
      puts "Result: #{result.to_a.inspect}"
    end
    
    second_query = con.query "SELECT sleep(4) as second_query" do |result|
      puts "Result: #{result.to_a.inspect}"
    end
  end
  
end
