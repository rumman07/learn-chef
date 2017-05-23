#
# Cookbook:: lamp
# Recipe:: database
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Load MYSQL passwords from the 'passwords' data bag.
passwords = data_bag_item('passwords', 'mysql')

#Configure the MYSQL client
mysql_client 'default' do
     action :create
end

#Configure the MYSQL service 
mysql_service 'default' do 
    initial_root_password passwords['root_password']
    action [:create, :start]
end

