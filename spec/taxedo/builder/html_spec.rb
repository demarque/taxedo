require 'spec_helper'

describe Taxedo::Builder::Html do
  #*************************************************************************************
  # PUBLIC INSTANCE METHODS
  #*************************************************************************************
  context "with a quebec receipt of 10,00$" do
    let(:receipt) { Taxedo::Region.new('quebec').calculate(1000) }

    describe "#generate" do
      pending "TOTEST"
    end
  end
end
