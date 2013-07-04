# Project

set :application, "satis"
set :repository, "ssh://git@git.example.com/#{application}"

set :asset_children, []
set :assets_install, false
set :normalize_asset_timestamps, false
set :cache_warmup, false
set :clear_controllers, false
set :shared_children, false
set :use_composer, true
set :composer_bin, "/usr/local/bin/composer"
set :composer_options, "--verbose --prefer-dist"

# Environment

set :domain, "#{application}.example.com"
set :branch, "master"

set :deploy_to, "/var/www/#{domain}"

role :web, domain # Your HTTP server, Apache/etc
role :app, domain # This may be the same as your `Web` server
role :db, domain, :primary => true

# Tasks

namespace :satis do
  desc "Build Satis."
  task :build do
    run "php #{release_path}/bin/satis build #{release_path}/app/config/repository.json #{release_path}/web"
  end
end

namespace :symfony do
  namespace :composer do
    desc "Runs composer to install vendors from composer.lock file"
    task :install, :roles => :app, :except => { :no_release => true } do
      run "#{try_sudo} sh -c 'cd #{latest_release} && #{composer_bin} install #{composer_options}'"
    end
  end
end

## Hooks

after "deploy:finalize_update", "satis:build"
after "deploy:update", "deploy:cleanup"

# General

set :scm, :git

# Server

set :user, "example"
set :group, "www-data"

set :use_sudo, false

# Releases

set :keep_releases, 5

# Remote Cache

set :deploy_via, :remote_cache
set :repository_cache, "cache"