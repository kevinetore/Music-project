set :stage, :test

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
server '178.62.225.26:22', user: 'deploy', roles: %w{web app db}

set :deploy_to, "/home/deploy/railsapps/podcast_fm/master"

set :rails_env, 'production'
set :branch, 'master'
