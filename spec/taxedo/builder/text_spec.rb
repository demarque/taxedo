require 'spec_helper'

describe Taxedo::Builder::Text do
  #*************************************************************************************
  # PUBLIC INSTANCE METHODS
  #*************************************************************************************
  context "with a quebec receipt of 100$" do
    let(:receipt) { Taxedo::Region.new('quebec').calculate(10000) }

    describe "#generate" do
      subject { Taxedo::Builder::Text.new(receipt).generate }
      it { should eql "Sous-total .... 100,00$\nTPS ...........  5,00$\nTVQ ...........  9,98$\nTotal ......... 114,98$"  }
    end
  end
end
