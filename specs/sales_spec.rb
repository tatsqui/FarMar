require 'csv'
require_relative 'spec_helper'

describe "Sale" do 
  let(:sale) {FarMar::Sale.new(id: 1, amount: 9290, purchase_time: "2013-11-07 4:34:06 -0800", vendor_id: 1, product_id: 3)}
  describe "initialize" do
    it "creates a new instance of a Sale" do 
      sale.must_be_kind_of FarMar::Sale
    end

    it "keeps track of sale id" do 
      sale.must_respond_to :id
      sale.id.must_equal 1
    end

    it "keeps track of sale id" do 
      sale.must_respond_to :id
      sale.id.must_equal 1
    end

    it "keeps track of amount" do 
      sale.must_respond_to :amount
      sale.amount.must_equal 9290
    end

    it "keeps track of purchase time" do 
      sale.must_respond_to :purchase_time
      sale.purchase_time.must_equal "2013-11-07 4:34:06 -0800"
    end

    it "keeps track of vendor id" do 
      sale.must_respond_to :vendor_id
      sale.vendor_id.must_equal 1
    end

    it "keeps track of product id" do 
      sale.must_respond_to :product_id
      sale.product_id.must_equal 3
    end

  end
end