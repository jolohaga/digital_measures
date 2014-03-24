require 'spec_helper'

describe DigitalMeasures::UserRole do
  before(:each) {
    username = "ringleader"
    
    # Create user
    params = { first_name: "Bilbo", last_name: "Baggins", email: "bilbo@uci.edu", local_authentication: username, username: username }
    resource = DigitalMeasures::User.new(params)
    request = Typhoeus::Request.new("#{dm_server}#{resource.path}", userpwd: dm_userpwd, method: resource.method, headers: dm_headers, body: resource.to_s)
    request.run
    
    # Create user schema
    user_schema_params = { ac_year: '2013-2014', college: 'Social Sciences', dep: 'Anthropology', username: username }
    resource = DigitalMeasures::UserSchema.new(user_schema_params)
    request = Typhoeus::Request.new("#{dm_server}#{resource.path}", userpwd: dm_userpwd, method: resource.method, headers: dm_headers, body: resource.to_s)
    request.run
  }
  
  after(:each) {
    username = "ringleader"
    
    # Delete user
    resource = DigitalMeasures::DeleteUser.new(username: username)
    request = Typhoeus::Request.new("#{dm_server}#{resource.path}", userpwd: dm_userpwd, method: resource.method, headers: dm_headers, body: resource.to_s)
    request.run
  }
  
  let(:username) { "ringleader" }
  
  it "produces valid XML", :vcr do
    resource = DigitalMeasures::UserRole.new(username: username)
    request = Typhoeus::Request.new("#{dm_server}#{resource.path}", userpwd: dm_userpwd, method: resource.method, headers: dm_headers, body: resource.to_s)
    response = request.run
    
    expect(response.body).to include("Success")
  end
end