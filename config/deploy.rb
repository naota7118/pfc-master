# frozen_string_literal: true

# config valid only for current version of Capistrano
# capistranoのバージョンを記載。固定のバージョンを利用し続け、バージョン変更によるトラブルを防止する
lock "3.14.1"

# Capistranoのログの表示に利用する
set :application, "pfc-master"
set :deploy_to, "/var/www/rails/pfc-master"

# どのリポジトリからアプリをpullするかを指定する
set :repo_url,  "https://github.com/naota7118/pfc-master.git"

# バージョンが変わっても共通で参照するディレクトリを指定
set :linked_dirs, fetch(:linked_dirs, []).push("log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads")

set :rbenv_type, :user
set :rbenv_ruby, "2.5.1"
set :rbenv_custom_path, "/home/naota/.rbenv"

# どの公開鍵を利用してデプロイするか
set :ssh_options, auth_methods: ["publickey"],
                  keys: ["~/.ssh/pfcmaster7118.pem"]

# プロセス番号を記載したファイルの場所
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

# Unicornの設定ファイルの場所
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

# master.keyを読み込ませる
set :linked_files, fetch(:linked_files, []).push("config/master.key")

# デプロイ処理が終わった後、Unicornを再起動するための記述
after "deploy:publishing", "deploy:restart"
namespace :deploy do
  task :restart do
    invoke "unicorn:restart"
  end
end



# namespace :deploy do
#   desc 'Restart application'
#   task :restart do
#     invoke 'unicorn:restart'
#   end

#   desc 'Create database'
#   task :db_create do
#     on roles(:db) do |host|
#       with rails_env: fetch(:rails_env) do
#         within current_path do
#           execute :bundle, :exec, :rake, 'db:create'
#         end
#       end
#     end
#   end

#   desc 'Run seed'
#   task :seed do
#     on roles(:app) do
#       with rails_env: fetch(:rails_env) do
#         within current_path do
#           execute :bundle, :exec, :rake, 'db:seed'
#         end
#       end
#     end
#   end

#   after :publishing, :restart

#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#     end
#   end
# end
