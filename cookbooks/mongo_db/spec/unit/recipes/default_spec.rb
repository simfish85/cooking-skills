#
# Cookbook Name:: mongo_db
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'mongo_db::default' do
  context 'When all attributes are default, on an unspecified platform' do
  	before do
  	  stub_command("mongoimport --db jobs--collection candidates --drop --file /tmp/seed-db.json").and_return(true)
  	  stub_command("mongo --eval \"printjson(db.adminCommand('listDatabases'));\" | grep jobs").and_return(true)
  	end

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs mongodb' do
      expect(chef_run).to install_package 'mongodb-org'
    end

    it 'enables the mongodb service' do
      expect(chef_run).to enable_service 'mongod'
    end

    it 'starts the mongodb service' do
      expect(chef_run).to start_service 'mongod'
    end

  	it 'creates the seed file' do
   	  expect(chef_run).to create_cookbook_file '/tmp/seed-db.json' 
  	end
  end
end



