require_relative 'spec_helper'

describe "Product" do
  before do
  @product = FarMar::Product.new(1, "Product", 10)
  end
  describe "initialize" do
    it  "creates instance of Product" do
      @product.must_be_kind_of FarMar::Product
    end

    it "keeps track of id" do
      @product.must_respond_to :id
      @product.id.must_equal 1
    end

    it "requires id to be a positive integer" do
      proc {
        FarMar::Product.new("test", "Product", 10)
      }.must_raise ArgumentError

      proc {
        FarMar::Product.new(-10, "Product", 10)
      }.must_raise ArgumentError
    end

    it "keeps track of name"  do
      @product.must_respond_to :name
      @product.name.must_equal  "Product"
    end

    it "requires name to be a string" do
      # do I need this test?
    end

    it "keeps track of vendor id" do
      @product.must_respond_to :vendor_id
      @product.vendor_id.must_equal 10
    end

    it "requires vendor_id to be a positive integer" do
      proc {
        FarMar::Product.new(1, "Product", "test")
      }.must_raise ArgumentError

      proc {
        FarMar::Product.new(1, "Product", -3)
      }.must_raise ArgumentError
    end
  end

  describe "all" do
    before do
      @products = FarMar::Product.all
    end

    it "returns an array of products" do
      @products.must_be_kind_of Array
    end

    it "returns a collection full of product instances" do
      @products.each do |product|
        product.must_be_kind_of FarMar::Product
      end
    end

    it "returns the correct amount of products" do
      @products.length.must_equal 8193
    end

  end

  describe "find" do
    it "finds the first product" do
      id = 1
      product = FarMar::Product.find(1)
      product.id.must_equal id
    end

    it "finds the last product" do
      id = 8193
      product = FarMar::Product.find(8193)
      product.id.must_equal id
    end

    it "returns nil for a product that doesn't exist" do
      product = FarMar::Product.find(83399)
      product.must_be_nil
    end
  end
end
