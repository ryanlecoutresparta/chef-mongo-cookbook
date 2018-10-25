#
# Cookbook:: mongodb
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'mongodb::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'should install mongod' do
      expect(chef_run).to upgrade_package "mongodb-org"
    end

    it 'should add mongo to the source list' do
      expect(chef_run).to add_apt_repository('mongodb-org')
    end

    it 'should update all sources' do
      expect(chef_run).to update_apt_update('update')
    end

    it 'should create a symlink of mongod.conf from sites-available to sites-enabled' do
      expect(chef_run).to create_link('/etc/mongodb/sites-enabled/mongod.conf').with_link_type(:symbolic)
    end

    it 'should delete the symlink from the default config in sites-enabled' do
      expect(chef_run).to delete_link('/etc/mongodb/sites-enabled/default')
    end

  end

end
