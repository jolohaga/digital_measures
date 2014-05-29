require 'spec_helper'

describe DigitalMeasures::Schteach do
  let(:username) { "ringleader" }
  let(:user_params) { { first_name: "Bilbo", last_name: "Baggins", email: "bilbo@uci.edu", local_authentication: username, username: username } }
  let(:user_schema_params) { { ac_year: '2014-2015', college: 'Social Sciences', dep: 'Anthropology', username: username } }
  let(:schema_data_params) { {tyt_term: "Fall", tyy_term: "2014", title: "Introduction to Social-Cultural Anthropology", coursepre: "ANTHRO", coursenum: "2", courseletter: "A", code: "60000", section: "1", level: "Lower division", enroll: "417", numinstructor: "1", percent_resp: "100", chours: "4.0", delivery_mode: "Lecture"} }

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
    let(:record) { DigitalMeasures::Record.new(username: username, schteach: [entity]) }
    let(:data) { DigitalMeasures::SchemaData.new(records: [record]) }
    
    it "produces valid XML", :vcr do
      request = Typhoeus::Request.new("#{dm_server}#{data.path}", userpwd: dm_userpwd, method: data.method, headers: dm_headers, body: data.to_s)
      response = request.run
      expect(response.body).to include("Success")
    end
  end
  
  describe "multiple data schema", :vcr do
    let(:schema_data_params_2) { {tyt_term: "Winter", tyy_term: "2015", title: "Introduction to Archaeology", coursepre: "ANTHRO", coursenum: "2", courseletter: "C", code: "60060", section: "A", level: "Lower division", enroll: "132", numinstructor: "1", percent_resp: "100", chours: "4.0", delivery_mode: "Lecture"} }
    let(:entity) { described_class.new(schema_data_params) }
    let(:entity_2) { described_class.new(schema_data_params_2) }
    let(:record) { DigitalMeasures::Record.new(username: username, schteach: [entity, entity_2]) }
    let(:data) { DigitalMeasures::SchemaData.new(records: [record]) }
    
    it "are saved" do
      request = Typhoeus::Request.new("#{dm_server}#{data.path}", userpwd: dm_userpwd, method: data.method, headers: dm_headers, body: data.to_s)
      response = request.run
      expect(response.body).to include("Success")
    end
  end
  
  describe "multiple records", :vcr do
    let(:username_2) { "wizard" }
    let(:user_params_2) { { first_name: "Gandalf", last_name: "The Grey", email: "gandalf@uci.edu", local_authentication: username_2, username: username_2 } }
    let(:user_schema_params_2) { { ac_year: '2014-2015', college: 'Physical Sciences', dep: 'Physics & Astronomy', username: username_2 } }
    
    before {
      create_user(params: user_params_2)
      create_user_schema(params: user_schema_params_2)
      assign_user_role(username: username_2)
    }
    after {
      delete_user(username: username_2)
    }
    
    let(:schema_data_params_2) { {tyt_term: "Fall", tyy_term: "2014", title: "Quantum Field Theory", coursepre: "PHYSICS", coursenum: "235", courseletter: "A", code: "48475", section: "A", level: "Graduate", enroll: "8", numinstructor: "1", percent_resp: "100", chours: "4.0", delivery_mode: "Lecture"} }
    
    let(:entity) { described_class.new(schema_data_params) }
    let(:record) { DigitalMeasures::Record.new(username: username, schteach: [entity]) }
    let(:entity_2) { described_class.new(schema_data_params_2) }
    let(:record_2) { DigitalMeasures::Record.new(username: username_2, schteach: [entity_2]) }
    let(:data) { DigitalMeasures::SchemaData.new(records: [record, record_2]) }
    
    it "are saved" do
      request = Typhoeus::Request.new("#{dm_server}#{data.path}", userpwd: dm_userpwd, method: data.method, headers: dm_headers, body: data.to_s)
      response = request.run
      expect(response.body).to include("Success")
    end
  end
end
