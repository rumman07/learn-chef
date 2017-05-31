# # encoding: utf-8

# Inspec test for recipe lamp_customers::default

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

# verifies that the "customers" table has a field named "id"
describe command("mysql -h 127.0.0.1 -uroot -pfakerootpassword -D 4thcoffee -e 'describe customers;'") do
     its('stdout') { should match(/id/) }
end 

# verifies that the homepage is accessible and contains the word "Customers"
describe command 'wget -qO- localhost' do 
    its('stdout') { should match(/Customers/) }
end  