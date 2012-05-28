require 'spec_helper'

describe Taxedo do
  describe "::region" do
    pending "TOTEST"
  end

  describe "::tax_for" do
    context "when getting the quebec tax for 10$ in text format" do
      subject { Taxedo.tax_for 'quebec', 1000, format: :text }

      it { should eql "Sous-total .... 10,00$\nTPS ...........  0,50$\nTVQ ...........  1,00$\nTotal ......... 11,50$" }

      context "with a non_taxable rule" do
        subject { Taxedo.tax_for 'quebec', 1000, format: :text, :rule => 'non_taxable' }

        it { should eql "Sous-total .... 10,00$\nTPS ...........  0,00$\nTVQ ...........  0,00$\nTotal ......... 10,00$" }
      end
    end

  end
end
