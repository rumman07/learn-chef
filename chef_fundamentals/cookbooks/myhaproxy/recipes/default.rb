#
# Cookbook:: myhaproxy
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#Just adding a new comment to initiate a change.

all_web_nodes = search('node',"role:web AND chef_environment:#{node.chef_environment}")

members = []

#populate member

all_web_nodes.each do |web_node|

  member = {
        'hostname' => web_node['hostname'],
	'ipaddress' => web_node['ipaddress'],
	'port' => 80,
	'ssl_port' => 80
}
  members.push(member)

end

node.default['haproxy']['members'] = members

include_recipe "haproxy::manual"




#node.default['haproxy']['members'] = [
#    {
#       "hostname" => 'web1',
#       "ipaddress" => '192.168.10.43',
#       "port" => 80,
#       "ssl_port" => 80
#}, {
#       "hostname" => 'web2',
#       "ipaddress" => '192.168.10.44',
#       "port" => 80,
#       "ssl_port" => 80
#	    
#}]

#include_recipe "haproxy::manual"
