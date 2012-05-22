require 'spec_helper'

describe Taxedo::Builder::Json do
  #*************************************************************************************
  # PUBLIC INSTANCE METHODS
  #*************************************************************************************
  context "with a quebec receipt of 10,00$" do
    let(:receipt) { Taxedo::Region.new('quebec').calculate(1000) }

    describe "#generate" do
      subject { Taxedo::Builder::Json.new(receipt).generate }
      it { should eql '{"subtotal":1000,"taxes":[{"id":"gst","name":"TPS","amount":50},{"id":"qst","name":"TVQ","amount":99}],"total":1149}'  }
    end
  end
end
