app_path = File.expand_path('../../../', __FILE__)
worker_processes 1

# set lets
$worker  = 2
$timeout = 30
$app_dir = "/var/www/pfc-master/current"
# $listen  = File.expand_path 'tmp/sockets/.unicorn.sock', $app_dir
$listen  = "#{app_path}/shared/tmp/sockets/unicorn.sock"
# $pid     = File.expand_path 'tmp/pids/unicorn.pid', $app_dir
$pid     = "#{app_path}/shared/tmp/pids/unicorn.pid"
$std_log = "#{app_path}/shared/log/unicorn.stderr.log"
$std_log = "#{app_path}/shared/log/unicorn.stdout.log"
# set config
worker_processes  $worker
# working_directory $app_dir
working_directory "#{app_path}/current"
stderr_path $std_log
stdout_path $std_log
timeout $timeout
listen  $listen
pid $pid
# loading booster
preload_app true
# before starting processes
before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      Process.kill "QUIT", File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end
# after finishing processes
after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
