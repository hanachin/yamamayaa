set :output, '/home/sei/yamamayaa/log/cron_log.log'

job_type :irkit, 'cd :path && `ruby -e "print Gem.user_dir"`/bin/bundle exec irkit --post :task :output'
job_type :yamamayaa_command, 'cd :path && :task :output'

(8..11).each do |h|
  every 1.day, at: "#{h}pm" do
    irkit 'light_darken'
  end
end

every 1.day, at: '7:20am' do
  irkit 'light_on'
end

every 1.day, at: '8:00am' do
  irkit 'light_off'
end

every 1.day, at: '12:00pm' do
  irkit 'light_on'
end

every 1.day, at: '1:00pm' do
  irkit 'light_off'
end

every 1.day, at: '12:00am' do
  irkit 'light_off'
  command 'sudo ntpd -qg'
end

every 5.minutes do
  yamamayaa_command './bin/ika.sh'
end
