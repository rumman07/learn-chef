# # encoding: utf-8

# Inspec test for recipe django_test_driven::install_pip

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

describe command ('django-admin --version') do
      its(:stdout) { should match(/1.11.3/) }
end 