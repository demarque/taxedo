require 'spec_helper'

describe Taxedo::Tax do
  #*************************************************************************************
  # PUBLIC INSTANCE METHODS
  #*************************************************************************************
  describe "#amount" do
    specify { Taxedo::Tax.new('gst').amount.should eql 0 }
  end

  let(:tax) { Taxedo::Tax.new('gst') }

  context "having a tax rate of 7% and a source amount of 100$" do
    before { tax.rate = 700 }
    before { tax.source_amount = 10000 }

    describe "#source_amount" do
      the("tax.amount") { should eql 700 }
      the("tax.source_amount") { should eql 10000 }
    end

    describe "#subtotal" do
      the("tax.subtotal") { should eql 10700 }
    end
  end
end
