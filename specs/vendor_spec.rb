require_relative 'spec_helper'

describe "Vendor" do
  describe "initialize" do
    before do
      @vendor = FarMar::Vendor.new id: 1, name: "Flying Lion Brewery", num_of_employees: 3, market_id: 12
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
        FarMar::Vendor.new(id: -1, name: "Flying Lion Brewery", num_of_employees: 3, market_id: 1)
      }.must_raise ArgumentError

      proc {
        FarMar::Vendor.new(id: "test", name: "Flying Lion Brewery", num_of_employees: 3, market_id: 1)
      }
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
        FarMar::Vendor.new(id: 1, name: "Flying Lion Brewery", num_of_employees: 3, market_id: "test")
      }.must_raise ArgumentError

      proc {
        FarMar::Vendor.new(id: 1, name: "Flying Lion Brewery", num_of_employees: 3, market_id: -11)
      }.must_raise ArgumentError
    end

    it "keeps track of number of employees" do
      @vendor.must_respond_to :num_of_employees
      @vendor.num_of_employees.must_equal 3
    end

    it "requires number of employees to be a positive integer" do
      proc {
        FarMar::Vendor.new(id: 1, name: "Flying Lion Brewery", num_of_employees: -3, market_id: 6)
      }.must_raise ArgumentError

      proc {
        FarMar::Vendor.new(id: 1, name: "Flying Lion Brewery", num_of_employees: "three", market_id: 4)
      }.must_raise ArgumentError
    end
  end

  describe "all" do
    before do
      @vendor = FarMar::Vendor.new id: 1, name: "Flying Lion Brewery", num_of_employees: 3, market_id: 12
    end
    it "keeps a record of all instances in vendor as an array" do
      @vendor.all.must_be_kind_of Array
    end

    it "has an accurate record of all instances" do

    end
  end
end
