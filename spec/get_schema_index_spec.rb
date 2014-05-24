require 'spec_helper'

describe DigitalMeasures::GetSchemaIndex do
  describe "get", :vcr do
    subject { described_class.new }
    it "succeeds" do
      request = Typhoeus::Request.new("#{dm_server}#{subject.path}", userpwd: dm_userpwd, method: subject.method, headers: dm_headers, body: subject.to_s)
      response = request.run
      expect(response.response_code).to eq 200
    end
  end
end
