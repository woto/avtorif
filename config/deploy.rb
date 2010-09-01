set :application, "avtorif"
set :repository,  "git@github.com:woto/avtorif.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

server "192.168.1.103", :app, :web, :db, :primary => true

set :use_sudo, true
default_run_options[:pty] = true
set :user, "deploy"

require 'rubygems'

require 'cap_recipes/tasks/delayed_job'

# bundler
namespace :bundler do
  task :bundle_install do
    run("cd #{release_path} && bundle install")
  end
end

after 'deploy:update_code', 'bundler:bundle_install'
#after 'deploy:update', 'bundler:bundle_install'


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
