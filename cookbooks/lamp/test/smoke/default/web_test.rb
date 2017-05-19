# # encoding: utf-8

# Inspec test for recipe lamp::web

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
describe package 'apache2' do 
    it { should be_installed }
end 

describe service 'apache2-default' do
    it { should be_enabled }
    it { should be_running }
end

describe command 'wget -qSO- --spider localhost' do
    its('stderr') { should match %r{HTTP/1\.1 200 OK} }
end  

describe port 80 do
    it { should be_listening }
end 
