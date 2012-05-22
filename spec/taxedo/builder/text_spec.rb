require 'spec_helper'

describe Taxedo::Builder::Text do
  #*************************************************************************************
  # PUBLIC INSTANCE METHODS
  #*************************************************************************************
  context "with a quebec receipt of 10,00$" do
    let(:receipt) { Taxedo::Region.new('quebec').calculate(1000) }

    describe "#generate" do
      subject { Taxedo::Builder::Text.new(receipt).generate }
      it { should eql "Sous-total .... 10,00$\nTPS ...........  0,50$\nTVQ ...........  0,99$\nTotal ......... 11,49$"  }
    end
  end
end
