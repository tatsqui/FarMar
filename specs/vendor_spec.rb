require_relative 'spec_helper'

describe "Vendor" do
  describe "initialize" do
    before do
      @vendor = FarMar::Vendor.new(1, "Flying Lion Brewery", 3, 12)
    end
    it "creates an instance of vendor" do
      @vendor.must_be_kind_of FarMar::Vendor
    end

    it "keeps track of vendor id" do
      @vendor.must_respond_to :id
      @vendor.id.must_equal 1
    end

    it "requires vendor id to be a positive integer" do
      proc {
        FarMar::Vendor.new(-1, "Flying Lion Brewery", 3, 12)
      }.must_raise ArgumentError

      proc {
        FarMar::Vendor.new("test", "Flying Lion Brewery", 3, 12)      }
    end

    it "keeps track of vendor name" do
      @vendor.must_respond_to :name
      @vendor.name.must_equal "Flying Lion Brewery"
    end

    it "keeps track of market_id" do
      @vendor.must_respond_to :market_id
      @vendor.market_id.must_equal 12
    end

    it "requires market id to be a positive integer" do
      proc {
        FarMar::Vendor.new(1, "Flying Lion Brewery", 3, "test")
      }.must_raise ArgumentError

      proc {
        FarMar::Vendor.new(1, "Flying Lion Brewery", 3, -11)
      }.must_raise ArgumentError
    end

    it "keeps track of number of employees" do
      @vendor.must_respond_to :num_of_employees
      @vendor.num_of_employees.must_equal 3
    end

    it "requires number of employees to be a positive integer" do
      proc {
        FarMar::Vendor.new(1, "Flying Lion Brewery", -3, 12)
      }.must_raise ArgumentError

      proc {
        FarMar::Vendor.new(1, "Flying Lion Brewery", "three", 12)
      }.must_raise ArgumentError
    end
  end

  describe "all" do
    before do
      @vendors = FarMar::Vendor.all
    end
    it "keeps a record of all instances in vendor as an array" do
      @vendors.must_be_kind_of Array
    end

    it "returns a collection of vendor instances" do
      @vendors.each do |vendor|
        vendor.must_be_kind_of FarMar::Vendor
      end
    end

    it "returns the correct number of vendors" do
      @vendors.length.must_equal 2690
    end

    it "returns the first record" do
      @vendors.first.id.must_equal 1
    end

    it "returns the last vendor record" do
      @vendors.last.id.must_equal 2690
    end
  end

  describe "find" do
    it "finds the first vendor" do
      id = 1
      vendor = FarMar::Vendor.find(1)
      vendor.id.must_equal id
    end

    it "finds the last vendor" do
      id = 2690
      vendor = FarMar::Vendor.find(2690)
      vendor.id.must_equal id
    end

    it "returns nil for a vendor that does not exist" do
      vendor = FarMar::Vendor.find(100000000)
      vendor.must_be_nil
    end
  end
end
