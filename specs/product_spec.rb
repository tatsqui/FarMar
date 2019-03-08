require_relative 'spec_helper'

describe "Product" do
  describe "initialize" do
    it  "creates instance of Product" do
      product = FarMar::Product.new(id: 1, name: "Product", vendor_id: 10)
      product.must_be_kind_of FarMar::Product
    end

    it "keeps track of id" do
      id = 2
      product = FarMar::Product.new(id: id, name: "Product", vendor_id: 10)
      product.must_respond_to :id
      product.id.must_equal id
    end

    it "requires id to be a positive integer" do
      proc {
        FarMar::Product.new(id: "test", name: "Product", vendor_id: 10)
      }.must_raise ArgumentError

      proc {
        FarMar::Product.new(id: -10, name: "Product", vendor_id: 10)
      }.must_raise ArgumentError
    end

    it "keeps track of name"  do
      name = "test name"
      product = FarMar::Product.new(id: 1, name: name, vendor_id: 10)

      product.must_respond_to :name
      product.name.must_equal  name
    end

    it "requires name to be a string" do
      # do I need this test?
    end

    it "keeps track of vendor id" do
      v_id = 7
      product = FarMar::Product.new(id: 1, name: "name", vendor_id: v_id)
      product.must_respond_to :vendor_id
      product.vendor_id.must_equal v_id
    end

    it "requires vendor_id to be a positive integer" do
      proc {
        FarMar::Product.new(id: 1, name: "Product", vendor_id: "test")
      }.must_raise ArgumentError

      proc {
        FarMar::Product.new(id: 1, name: "Product", vendor_id: -3)
      }.must_raise ArgumentError
    end
  end
end
