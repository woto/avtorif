RAILS_ROOT = "./"
RAILS_ENV = "development"

%w{8000}.each do |port|
  God.watch do |w|
    w.env = {
       'RAILS_ROOT' => "#{RAILS_ROOT}",
       'RAILS_ENV' => "#{RAILS_ENV}"
    }
    w.group = 'mngrl'
    w.name = "mngrl-#{port}"
    w.uid = "woto"
    w.gid = "users"
    w.interval = 30.seconds
    w.start = "cd #{RAILS_ROOT} && mongrel_rails cluster::start -C #{RAILS_ROOT}/config/mongrel_cluster.yml --clean --only #{port}"
    w.stop = "cd #{RAILS_ROOT} && mongrel_rails cluster::stop -C #{RAILS_ROOT}/config/mongrel_cluster.yml --clean --only #{port}"
    w.restart = "cd #{RAILS_ROOT} && mongrel_rails cluster::restart -C #{RAILS_ROOT}/config/mongrel_cluster.yml --clean --only #{port}"
    w.start_grace = 10.seconds
    w.restart_grace = 10.seconds
    #w.pid_file = File.join(RAILS_ROOT, "tmp/pids/mongrel.#{port}.pid")
    w.log = "#{RAILS_ROOT}/log/mngrl-0.log"
    w.err_log = "#{RAILS_ROOT}/log/mngrl-0.err.log"
    
    w.behavior(:clean_pid_file)

    w.start_if do |start|
      start.condition(:process_running) do |c|
        c.interval = 5.seconds
        c.running = false
      end
    end
    
    w.restart_if do |restart|
    
      restart.condition(:http_response_code) do |c|
        c.host = 'localhost'
        c.port = port
        c.path = '/'
        c.code_is_not = 200
        c.timeout = 3.seconds
        c.times = [2, 5]
      end

      restart.condition(:memory_usage) do |c|
        c.above = 150.megabytes
        c.times = [3, 5] # 3 out of 5 intervals
      end
    
      restart.condition(:cpu_usage) do |c|
        c.above = 50.percent
        c.times = 5
      end
    end

    # lifecycle
    w.lifecycle do |on|
      on.condition(:flapping) do |c|
        c.to_state = [:start, :restart]
        c.times = 5
        c.within = 5.minute
        c.transition = :unmonitored
        c.retry_in = 10.minutes
        c.retry_times = 5
        c.retry_within = 2.hours
      end
    end
    
  end
end
