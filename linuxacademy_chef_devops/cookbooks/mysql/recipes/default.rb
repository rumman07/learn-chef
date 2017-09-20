#
# Cookbook:: mysql
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'mariadb-server' do 
  action :install
end 

%w[mariadb-libs mariadb].each do |pkg|
  package pkg do
    action :install
  end
end 
 

