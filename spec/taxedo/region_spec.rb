require 'spec_helper'

describe Taxedo::Region do
  #*************************************************************************************
  # PUBLIC INSTANCE METHODS
  #*************************************************************************************
  describe "#calculate" do
    context "with the quebec region" do
      let(:region) { Taxedo::Region.new('quebec') }

      context "when calculating taxes on 10.00$" do
        let(:result) { region.calculate(1000) }

        the("result.taxes.length") { should eql 2 }
        the("result.total") { should eql 1149 }

        context "in July 1994" do
          let(:result) { region.calculate(1000, :on => Time.parse('1994-07-01')) }
          the("result.total") { should eql 1139 }
        end
      end
    end

    context "with the can region" do
      let(:region) { Taxedo::Region.new('can') }

      context "when calculating taxes on 10.00$" do
        let(:result) { region.calculate(1000) }

        the("result.taxes.length") { should eql 1 }
        the("result.total") { should eql 1050 }
      end
    end
  end

end
