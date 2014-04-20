require 'spec_helper'

describe DigitalMeasures::Schteach do
  describe "validity" do
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
      
      # Assign a user role
      resource = DigitalMeasures::UserRole.new(username: username)
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
    
    let(:username) { 'ringleader' }
    let(:params) { {tyt_term: "Fall", tyy_term: "2014", title: "ANTHRO", coursepre: "", coursenum: "101", courseletter: "", code: "", section: "1", level: "", enroll: "", numinstructor: "", chours: "", delivery_mode: "Lecture", username: username} }
    let(:entity) { DigitalMeasures::Schteach.new(params) }
    let(:record) { DigitalMeasures::Record.new(username: username, schteach: [entity]) }
    let(:data) { DigitalMeasures::SchemaData.new(records: [record]) }
    
    it "produces valid XML", :vcr do
      request = Typhoeus::Request.new("#{dm_server}#{entity.path}", userpwd: dm_userpwd, method: entity.method, headers: dm_headers, body: data.to_s)
      response = request.run
      expect(response.body).to include("Success")
    end
  end
end