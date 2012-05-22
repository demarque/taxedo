require 'spec_helper'

describe Taxedo::Builder::Json do
  #*************************************************************************************
  # PUBLIC INSTANCE METHODS
  #*************************************************************************************
  context "with a quebec receipt of 100$" do
    let(:receipt) { Taxedo::Region.new('quebec').calculate(10000) }

    describe "#generate" do
      subject { Taxedo::Builder::Json.new(receipt).generate }
      it { should eql '{"subtotal":10000,"taxes":[{"id":"gst","name":"TPS","amount":500},{"id":"qst","name":"TVQ","amount":998}],"total":11498}'  }
    end
  end
end
