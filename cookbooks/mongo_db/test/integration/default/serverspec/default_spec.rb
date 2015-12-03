require 'spec_helper'

# Ensure that the mongod service has been successfully installed and is running
describe 'the mongod service' do
  it 'is enabled' do
    expect(service 'mongod').to be_enabled
  end
  it 'is running' do
    expect(service 'mongod').to be_running
  end
end

describe 'the database seed file' do
  it 'was imported successfully' do
    expect(command("mongo --eval \"printjson(db.adminCommand('listDatabases'));\"").stdout).to match /jobs/
  end
end

describe 'the imported database' do
  it 'contains expected entries' do
  	expect(command("mongo --eval \"printjson(db.getSiblingDB('jobs').candidates.findOne({name: 'Simon Fisher'}));\"").stdout).not_to match /null/
  end
end

