require 'spec_helper'

describe DigitalMeasures::Pci do
  let(:username) { "ringleader" }
  let(:user_params) { { first_name: "Bilbo", last_name: "Baggins", email: "bilbo@uci.edu", local_authentication: username, username: username } }
  let(:user_schema_params) { { ac_year: '2014-2015', college: 'Social Sciences', dep: 'Anthropology', username: username } }
  let(:schema_data_params) { { prefix: "Professor", fname: "Bilbo", pfname: "", mname: "", lname: "Baggins",suffix: "", office_address: "123 Shire Bldg", email: "ringleader@uci.edu", website: "www.physics.uci.edu/~ringleader" } }

  before(:each) {
    create_user(params: user_params)
    create_user_schema(params: user_schema_params)
    assign_user_role(username: username)
  }
  after(:each) {
    delete_user(username: username)
  }
  
  describe "validity" do
    let(:entity) { described_class.new(schema_data_params) }
    let(:record) { DigitalMeasures::Record.new(username: username, pci: [entity]) }
    let(:data) { DigitalMeasures::SchemaData.new(records: [record]) }
    
    it "produces valid XML", :vcr do
      request = Typhoeus::Request.new("#{dm_server}#{data.path}", userpwd: dm_userpwd, method: data.method, headers: dm_headers, body: data.to_s)
      response = request.run
      expect(response.body).to include("Success")
    end
  end
end
