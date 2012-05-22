require 'spec_helper'

describe Taxedo::Region do
  #*************************************************************************************
  # PUBLIC INSTANCE METHODS
  #*************************************************************************************
  describe "#calculate" do
    context "with the quebec region" do
      let(:region) { Taxedo::Region.new('quebec') }

      context "when calculating taxes on 100$" do
        let(:result) { region.calculate(10000) }

        the("result.taxes.length") { should eql 2 }
        the("result.total") { should eql 11498 }

        context "in July 1994" do
          let(:result) { region.calculate(10000, :on => Time.parse('1994-07-01')) }
          the("result.total") { should eql 11396 }
        end
      end
    end

    context "with the can region" do
      let(:region) { Taxedo::Region.new('can') }

      context "when calculating taxes on 100$" do
        let(:result) { region.calculate(10000) }

        the("result.taxes.length") { should eql 1 }
        the("result.total") { should eql 10500 }
      end
    end
  end

end
