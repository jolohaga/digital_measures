require 'spec_helper'

describe DigitalMeasures::SchemaIndex, :vcr do
  let(:index_keys) { ["PROGRAM", "COLLEGE", "DEPARTMENT", "USERNAME", "USER_ENABLED"] }
  
  def prepared_schema_index
    resource = DigitalMeasures::GetSchemaIndex.new
    request = Typhoeus::Request.new("#{dm_server}#{resource.path}", userpwd: dm_userpwd, method: resource.method, headers: dm_headers, body: resource.to_s)
    response = request.run
    DeepHash.convert(DigitalMeasures::SchemaIndex.from_xml(response.body), filter: [:@roxml_references])
  end
  
  it "has a useful structure" do
    schema_index = prepared_schema_index
    expect(schema_index.keys).to include(:indexes)
    expect(schema_index[:indexes].all? {|i| i[:index_entries].present?}).to be true
    schema_index[:indexes].each do |i|
      expect(i[:index_entries].all? {|e| e[:entry_key].present? && e[:href].present?}).to be true
    end
  end
  
  it "provides the index keys" do
    schema_index = prepared_schema_index
    expect(schema_index[:indexes].collect {|i| i[:index_key]}).to match_array(index_keys)
  end
end
