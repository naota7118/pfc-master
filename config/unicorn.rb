# ../が一つ増えている
app_path = File.expand_path('../../../', __FILE__)

worker_processes 1
# currentを指定
working_directory "#{app_path}/current"

# それぞれ、sharedの中を参照するよう変更
listen "#{app_path}/shared/tmp/sockets/unicorn.sock"
pid "#{app_path}/shared/tmp/pids/unicorn.pid"
stderr_path "#{app_path}/shared/log/unicorn.stderr.log"
stdout_path "#{app_path}/shared/log/unicorn.stdout.log"