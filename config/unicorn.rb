# 以下はunicornを使った手動でのデプロイの時に使う
app_path = File.expand_path('../../', __FILE__)

worker_processes 1

working_directory app_path
pid "#{app_path}/tmp/pids/unicorn.pid"
listen "#{app_path}/tmp/sockets/unicorn.sock"
stderr_path "#{app_path}/log/unicorn.stderr.log"
stdout_path "#{app_path}/log/unicorn.stdout.log"

# 以下はCapistranoの自動デプロイの時に使う

# # ../が一つ増えている
# app_path = File.expand_path('../../../', __FILE__)

# worker_processes 1
# # currentを指定
# working_directory "#{app_path}/current"

# # それぞれ、sharedの中を参照するよう変更
# listen "#{app_path}/shared/tmp/sockets/unicorn.sock"
# pid "#{app_path}/shared/tmp/pids/unicorn.pid"
# stderr_path "#{app_path}/shared/log/unicorn.stderr.log"
# stdout_path "#{app_path}/shared/log/unicorn.stdout.log"