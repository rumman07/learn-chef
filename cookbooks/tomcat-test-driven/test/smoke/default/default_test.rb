# # encoding: utf-8

# Inspec test for recipe tomcat::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

#unless os.windows?
  # This is an example test, replace with your own test.
  #describe user('root'), :skip do
   # it { should exist }
  #end
#end

# This is an example test, replace it with your own test.
#describe port(80), :skip do
 # it { should_not be_listening }
#end
#require 'spec_helper'

#describe 'tomcat::default' do
    describe command("curl http://localhost:8080") do
          its(:stdout) { should match /Helvetica/ }
    end

    describe package('java-1.7.0-openjdk-devel') do
          it { should be_installed }
    end
    describe group('tomcat') do
      it { should exist }
    end

    describe user('tomcat') do
      it { should exist }
      it { should belong_to_group 'tomcat' }
      it { should have_home_directory '/opt/tomcat' }
    end
    
    describe file('/opt/tomcat') do
          it { should exist }
          it { should be_directory }
    end 

    describe file('/opt/tomcat/conf') do
       it { should exist }
       it { should be_mode 0070 }
    end 
#execute 'chown -R tomcat webapps/ work/ temp/ logs/'
%w[ webapps work temp logs ].each do |path|
     describe file("/opt/tomcat/#{path}") do
         it { should exist }
         it { should be_owned_by 'tomcat' }
      end
  end 