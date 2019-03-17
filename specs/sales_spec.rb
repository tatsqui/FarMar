require 'csv'
require_relative 'spec_helper'

describe "Sale" do 
  describe "initialize" do
    it "creates a new instance of a Sale" do 
      sale = FarMar::Sale.new(id: 1, amount: 9290, purchase_time: "2013-11-07 4:34:06 -0800", vendor_id: 1, product_id: 1)

      sale.must_be_kind_of FarMar::Sale
    end
  end
end