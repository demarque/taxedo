require 'spec_helper'

describe Taxedo::Builder::Hash do
  #*************************************************************************************
  # PUBLIC INSTANCE METHODS
  #*************************************************************************************
  context "with a quebec receipt of 10,00$" do
    let(:receipt) { Taxedo::Region.new('quebec').calculate(1000) }

    describe "#generate" do
      let(:hash) { Taxedo::Builder::Hash.new(receipt).generate }

      the("hash[:subtotal]") { should eql 1000 }
      the("hash[:taxes][0][:id]") { should eql 'gst' }
      the("hash[:taxes][0][:amount]") { should eql 50 }
      the("hash[:taxes][1][:id]") { should eql 'qst' }
      the("hash[:total]") { should eql 1149 }
    end
  end
end
