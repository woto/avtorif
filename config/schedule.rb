# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "log/schedule.log"
set :environment, :development
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

every 1.minute do
  require 'lib/job_walker'
  runner "JobWalker.new.call"
end

every 1.hours do
  rake "avtorif:destroy_old_supplier_prices"
end

# Learn more: http://github.com/javan/whenever
