set :output, '/home/sei/yamamayaa/log/cron_log.log'

job_type :irkit, 'cd :path && `ruby -e "print Gem.user_dir"`/bin/bundle exec irkit --post :task :output'

every 1.minute do
  irkit 'light_down'
end
