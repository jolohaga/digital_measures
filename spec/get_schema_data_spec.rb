require 'spec_helper'

describe DigitalMeasures::GetSchemaData do
  describe "date_query" do
    subject { described_class.new }
    
    context "with an invalid date_query" do
      let(:date_query) { "a" }
    
      it { expect { subject.date_query = date_query }.to raise_error(ArgumentError) }
    end
  end
  
  describe "path" do
    context "with both index_key_entry_keys and entity_keys missing" do
      it { expect { subject.path }.to raise_error(ArgumentError) }
    end
  end
  
  describe "get" do
    subject { described_class.new(index_key_entry_keys: index_key_entry_keys, entity_keys: entity_keys, date_query: date_query) }
    
    context "with valid index_key_entry_keys", :vcr do
      let(:index_key_entry_keys) { "DEPARTMENT:Statistics" }
      let(:entity_keys) { nil }
      let(:date_query) { DigitalMeasures::DateQuery.new }
      
      it "succeeds" do
        request = Typhoeus::Request.new("#{dm_server}#{subject.path}", userpwd: dm_userpwd, method: subject.method, headers: dm_headers, body: subject.to_s)
        response = request.run
        expect(response.response_code).to eq 200
      end
    end
    
    context "with valid entity_keys and date_query", :vcr do
      let(:index_key_entry_keys) { nil }
      let(:entity_keys) { "SCHTEACH" }
      let(:date_query) { DigitalMeasures::DateQuery.new(start_date: 2.months.ago, end_date: Date.today) }
      
      it "succeeds" do
        request = Typhoeus::Request.new("#{dm_server}#{subject.path}", userpwd: dm_userpwd, method: subject.method, headers: dm_headers, body: subject.to_s)
        response = request.run
        expect(response.response_code).to eq 200
      end
    end
    
    context "with valid index_key_entry_keys and entity_keys", :vcr do
      let(:index_key_entry_keys) { "DEPARTMENT:Statistics" }
      let(:entity_keys) { "SCHTEACH" }
      let(:date_query) { DigitalMeasures::DateQuery.new }
      
      it "succeeds" do
        request = Typhoeus::Request.new("#{dm_server}#{subject.path}", userpwd: dm_userpwd, method: subject.method, headers: dm_headers, body: subject.to_s)
        response = request.run
        expect(response.response_code).to eq 200
      end
    end
  end
end
