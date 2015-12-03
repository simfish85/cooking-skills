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
  let(:db_seed) { '/tmp/seed-db.json' }
  it 'exists' do
    expect(file db_seed).to exist
  end
  it 'is a file' do
    expect(file db_seed).to be_file
  end
end
