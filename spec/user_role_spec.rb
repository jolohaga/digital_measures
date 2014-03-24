require 'spec_helper'

describe DigitalMeasures::UserRole do
  let(:username) { "ringleader" }
  let(:user_params) { { first_name: "Bilbo", last_name: "Baggins", email: "bilbo@uci.edu", local_authentication: username, username: username } }
  let(:user_schema_params) { { ac_year: '2013-2014', college: 'Social Sciences', dep: 'Anthropology', username: username } }
  
  before(:each) {
    create_user(params: user_params)
    create_user_schema(params: user_schema_params)
  }
  after(:each) {
    delete_user(username: username)
  }
  
  it "produces valid XML", :vcr do
    resource = DigitalMeasures::UserRole.new(username: username)
    request = Typhoeus::Request.new("#{dm_server}#{resource.path}", userpwd: dm_userpwd, method: resource.method, headers: dm_headers, body: resource.to_s)
    response = request.run
    
    expect(response.body).to include("Success")
  end
end