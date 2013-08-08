# -*- encoding : utf-8 -*-

set :application, "balloons"
set :scm, :git
set :scm_verbose, true

set :repository,  "git@github.com:secretariat/balloons.git"
set :deploy_to, "/home/user/www/sites/balloons"
set :branch, 'master'

set :deploy_via, :copy
set :use_sudo, false
set :keep_releases, 5

role :web, "185.16.40.109"                          # Your HTTP server, Apache/etc
role :app, "185.16.40.109"                          # This may be the same as your `Web` server
role :db,  "185.16.40.109", :primary => true # This is where Rails migrations will run
role :db,  "185.16.40.109"

set :user, "user"
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
ssh_options[:auth_methods] = ["publickey"]
ssh_options[:port] = 2200
ssh_options[:keys] = ["#{ENV['HOME']}/install/ruby/amazon/vps.pem"]



# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end