#
# Cookbook Name:: mongo_db
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

apt_repository 'mongodb' do
  uri 'http://repo.mongodb.org/apt/ubuntu'
  components ['multiverse']
  distribution 'trusty/mongodb-org/3.0'
  key '7F0CEB10'
  keyserver 'keyserver.ubuntu.com'
  action :add
end

package 'mongodb-org'

service 'mongod' do
  action [:enable, :start]
end
