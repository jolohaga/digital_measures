require 'spec_helper'

describe DigitalMeasures::User do
  let(:user_params) { { first_name: "Bilbo", last_name: "Baggins", email: "bilbo@uci.edu", local_authentication: "ringleader", username: "ringleader" } }
  let(:resource) { described_class.new(user_params) }
  
  it "produces valid XML", :vcr do
    request = Typhoeus::Request.new("#{dm_server}#{resource.validate_path}", userpwd: dm_userpwd, method: resource.method, headers: dm_headers, body: resource.to_s)
    response = request.run
    expect(response.body).to include("Success")
  end
end
