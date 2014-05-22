require 'spec_helper'

describe DigitalMeasures::DeleteUser do
  let(:username) { "ringleader" }
  let(:params) { { first_name: "Bilbo", last_name: "Baggins", email: "bilbo@uci.edu", local_authentication: username, username: username } }
  
  before(:each) {
    create_user(params: params)
  }
  
  it "does delete the user", :vcr do
    resource = described_class.new(username: username)
    request = Typhoeus::Request.new("#{dm_server}#{resource.path}", userpwd: dm_userpwd, method: resource.method, headers: dm_headers, body: resource.to_s)
    response = request.run
    
    expect(response.body).to include("Removed")
    expect(response.body).to include("Success")
  end
end
