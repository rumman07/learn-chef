#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
package 'java-1.7.0-openjdk-devel' do
        action :install
end

#sudo groupadd tomcat
group 'tomcat' do
    action :create
end

#sudo useradd -M -s /bin/nologin -g tomcat -d /opt/tomcat tomcat
user 'tomcat' do
    manage_home false 
    shell '/bin/nologin'
    group 'tomcat'
    home '/opt/tomcat'
end 

execute 'wget http://apache.mirrors.ionfish.org/tomcat/tomcat-8/v8.5.14/bin/apache-tomcat-8.5.14.tar.gz' do
    not_if { ::File.exists?('apache-tomcat-8.5.14.tar.gz') }
end

#remote_file 'apache-tomcat-8.0.43.tar.gz' do
      #source 'http://apache.mirrors.ionfish.org/tomcat/tomcat-8/v8.0.43/bin'
#end

directory '/opt/tomcat' do
    action :create
    group 'tomcat'
end

execute 'tar xvf apache-tomcat-8.5.14*tar.gz -C /opt/tomcat --strip-components=1'
#execute 'extracting-tar' do
     #command 'gunzip apache-tomcat-8.5.14*tar.gz'
     #command 'tar xvf apache-tomcat-8.5.14*tar -C /opt/tomcat --strip-components=1'
#end
 
 execute 'chgrp -R tomcat /opt/tomcat/conf*'

 directory '/opt/tomcat/conf' do
     mode '0070'
 end 

execute 'chmod ug+rwx /opt/tomcat/conf/*'

execute 'chown -R tomcat /opt/tomcat/webapps/ /opt/tomcat/work/ /opt/tomcat/temp/ /opt/tomcat/logs/ /opt/tomcat/'

template '/etc/systemd/system/tomcat.service' do 
    source 'tomcat.service.erb'
end

execute 'systemctl daemon-reload'

#execute 'sudo -i'

service 'tomcat' do
    action [:enable, :start]
end 