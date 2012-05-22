require 'spec_helper'

describe Taxedo::Tax do
  #*************************************************************************************
  # PUBLIC INSTANCE METHODS
  #*************************************************************************************
  describe "#amount" do
    specify { Taxedo::Tax.new('gst').amount.should eql 0 }
  end

  let(:tax) { Taxedo::Tax.new('gst') }

  context "having a tax rate of 7% and a source amount of 10$" do
    before { tax.rate = 700 }
    before { tax.source_amount = 1000 }

    describe "#source_amount" do
      the("tax.amount") { should eql 70 }
      the("tax.source_amount") { should eql 1000 }
    end

    describe "#subtotal" do
      the("tax.subtotal") { should eql 1070 }
    end
  end
end
