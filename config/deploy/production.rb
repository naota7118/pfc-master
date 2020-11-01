server "176.34.34.208", user: "naota", roles: %w{app db web}

# デプロイするサーバーにsshログインする鍵の情報を記述
set :ssh_options, keys: "~/.ssh/pfcmaster7118_key_rsa"