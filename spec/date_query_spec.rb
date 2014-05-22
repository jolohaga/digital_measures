require 'spec_helper'

describe DigitalMeasures::DateQuery do
  describe "new" do
    subject { described_class }
    
    context "with nil dates" do
      let(:start_date) { nil }
      let(:end_date) { nil }
      
      it { expect { subject.new(start_date: start_date, end_date: end_date) }.to raise_error(ArgumentError) }
    end
    
    context "with non-dates" do
      let(:start_date) { "a" }
      let(:end_date) { 1 }
      
      it { expect { subject.new(start_date: start_date, end_date: end_date) }.to raise_error(ArgumentError) }
    end
  end
  
  describe "attr writers" do
    subject { described_class.new }
    
    let(:start_date) { nil }
    let(:end_date) { nil }
    
    context "with nil dates" do
      describe "start_date=" do
        it { expect { subject.start_date = start_date }.to raise_error(ArgumentError) }
      end
    
      describe "end_date=" do
        it { expect { subject.end_date = end_date }.to raise_error(ArgumentError) }
      end
    end
  end
  
  describe "to_s" do
    subject { described_class.new }
    
    context "with uninitialized attributes" do
      it { expect(subject.to_s).to eq "" }
    end
    
    context "with valid attributes" do
      subject { described_class.new(start_date: start_date, end_date: end_date) }
      
      let(:start_date) { Date.today }
      let(:end_date) { Date.today+30 }
      
      it { expect(subject.to_s).to eq "?startDate=#{start_date}?endDate=#{end_date}" }
    end
  end
end
