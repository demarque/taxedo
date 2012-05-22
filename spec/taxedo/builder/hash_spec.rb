require 'spec_helper'

describe Taxedo::Builder::Hash do
  #*************************************************************************************
  # PUBLIC INSTANCE METHODS
  #*************************************************************************************
  context "with a quebec receipt of 100$" do
    let(:receipt) { Taxedo::Region.new('quebec').calculate(10000) }

    describe "#generate" do
      let(:hash) { Taxedo::Builder::Hash.new(receipt).generate }

      the("hash[:subtotal]") { should eql 10000 }
      the("hash[:taxes][0][:id]") { should eql 'gst' }
      the("hash[:taxes][0][:amount]") { should eql 500 }
      the("hash[:taxes][1][:id]") { should eql 'qst' }
      the("hash[:total]") { should eql 11498 }
    end
  end
end
