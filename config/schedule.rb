set :output, '/home/sei/yamamayaa/log/cron_log.log'

job_type :irkit, 'cd :path && `ruby -e "print Gem.user_dir"`/bin/bundle exec irkit --post :task :output'

(8..11).each do |h|
  every 1.day, at: "#{h}pm" do
    irkit 'light_darken'
  end
end

every 1.day, at: '12:00am' do
  irkit 'light_off'
end
