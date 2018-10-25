# # encoding: utf-8

# Inspec test for recipe mongodb::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/


  # This is an example test, replace with your own test.


# This is an example test, replace it with your own test.
describe package 'mongodb-org' do
  it { should be_installed }
  its('version') { should match /3\./ }
end

describe port(27017) do
  it { should be_listening }
end
