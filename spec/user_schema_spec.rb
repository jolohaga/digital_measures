describe DigitalMeasures::UserSchema do
  let(:username) { "ringleader" }
  let(:user_params) { { first_name: "Bilbo", last_name: "Baggins", email: "bilbo@uci.edu", local_authentication: username, username: username } }
  let(:user_schema_params) { { ac_year: '2013-2014', college: 'Social Sciences', dep: 'Anthropology', username: username } }
  
  before(:each) {
    create_user(params: user_params)
  }
  after(:each) {
    delete_user(username: username)
  }
  
  it "generates a valid user schema", :vcr do
    resource = described_class.new(user_schema_params)
    request = Typhoeus::Request.new("#{dm_server}#{resource.path}", userpwd: dm_userpwd, method: resource.method, headers: dm_headers, body: resource.to_s)
    response = request.run
    
    expect(response.body).to include("Success")
  end
end
