#config/deploy.rb
require "bundler/capistrano"
load "deploy/assets"

# Git repository
set :scm,         "git"
set :repository,  "git@github.com:xxxcaqui/pic_share.git"
set :branch,      "master"
set :ssh_options, { forward_agent: true }

# Server setting
ec2 = "ec2-54-249-72-143.ap-northeast-1.compute.amazonaws.com"
role :web, ec2
role :app, ec2
role :db,  ec2, :primary => true

set :application, "pic_share"
set :user, "rails"
set :use_sudo, false
set :deploy_to, "/home/#{user}/#{application}"
set :rails_env, "production"
default_run_options[:shell] = '/bin/bash --login'
