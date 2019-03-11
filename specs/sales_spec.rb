require 'csv'
require_relative 'spec_helper'

describe "Sale" do 
  describe "initialize" do
    it "creates a new instance of a Sale" do 
      sale = FarMar::Sale.new(1, 9290, "2013-11-07 4:34:06 -0800", 1, 1)

      sale.must_be_kind_of FarMar::Sale
    end
  end
end