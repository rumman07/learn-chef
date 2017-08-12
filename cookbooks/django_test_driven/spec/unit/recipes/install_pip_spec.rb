#
# Cookbook:: django_test_driven
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'django_test_driven::install_pip' do
  context 'When all attributes are default, on an Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    it 'installs the necessary packages' do
       expect(chef_run).to install_package('python3-pip')
    end 

    it 'installs django framework' do
       expect(chef_run).to run_execute('pip3 install django')
    end
  end
end  
