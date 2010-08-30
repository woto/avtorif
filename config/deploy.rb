set :application, "avtorif"
set :repository,  "git://github.com/woto/avtorif.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

server "192.168.1.103", :app, :web, :db, :primary => true

default_run_options[:pty] = true

require 'rubygems'

require 'cap_recipes/tasks/delayed_job'
#set :delayed_script_path, 'script/djworker' # defaults to 'script/delayed_job'
#set :delayed_job_env, 'staging' # defaults to production

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

require 'cap_recipes/tasks/rails'
require 'cap_recipes/tasks/ruby'
require 'cap_recipes/tasks/rubygems'
require 'cap_recipes/tasks/apache'
require 'cap_recipes/tasks/whenever'

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

desc "bla-bla"
task :search_libs, :hosts => "woto-work" do
  #run "ls -x1 /usr/lib | grep -i xml"
  run "df -h /"
end
