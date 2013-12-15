require "rvm/capistrano"                  
require "capistrano/ext/multistage"
require 'bundler/capistrano'

set :stages, %w(productions)
set :default_stage, "productions"

set :use_sudo, false
set :scm, :git
set :git_shallow_clone, 1
set :git_enable_submodules, 1
set :deploy_via, :remote_cache
set :deploy_env, 'production'
default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :deployer, `whoami`.chomp

set :application, 'phecda_erp'
set :repo_url, 'https://github.com/zhanghong/phecda_erp.git'
set :branch, "master"

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# set :deploy_to, '/var/www/my_app'
# set :scm, :git

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end
