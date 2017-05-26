# # encoding: utf-8

# Inspec test for recipe lamp::database

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# unless os.windows?
#   # This is an example test, replace with your own test.
#   describe user('root'), :skip do
#     it { should exist }
#   end
# end

# # This is an example test, replace it with your own test.
# describe port(80), :skip do
#   it { should_not be_listening }
# end

describe mysql_conf('/etc/mysql-default/my.cnf').params('mysqld') do 
    its('port') { should eq '3306' }
    its('socket') { should eq '/run/mysql-default/mysqld.sock' }
end

describe port 3306 do
    it { should be_listening }
    its('protocols') { should include('tcp') }
end 

describe command("mysql -h 127.0.0.1 -uroot -pfakerootpassword -s -e 'show databases;'") do
    its('stdout') { should match(/mysql/) }
end 
