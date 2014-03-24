require 'spec_helper'

describe DigitalMeasures::Resource do
  describe "to_s" do
    before { class Resource < DigitalMeasures::Resource; end }
    
    let(:resource) { Resource.new }
    
    subject { resource.to_s }
    
    it "produces XML" do
      expect(subject).to eq "<Resource/>"
    end
  end
  
  describe "xml_convention" do
    before { class RESOURCE < DigitalMeasures::Resource; end }
    
    let(:resource) { RESOURCE.new }
    
    subject { resource.to_s }
    
    it "camelcases XML tags by default" do
      expect(subject).to eq "<Resource/>"
    end
  end
  
  describe "method" do
    let(:resource) { DigitalMeasures::Resource.new }
    
    subject { resource.method }
    
    it "defines :post by default" do
      expect(subject).to eq :post
    end
  end
end
