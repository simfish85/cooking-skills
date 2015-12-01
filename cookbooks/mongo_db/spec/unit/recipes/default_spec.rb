#
# Cookbook Name:: mongo_db
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'mongo_db::default' do
  context 'on Ubuntu ' do
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
  end
end
