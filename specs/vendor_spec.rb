require_relative 'spec_helper'

describe "Vendor" do
  describe "initialize" do

    it "creates an instance of vendor" do
      vendor = FarMar::Vendor.new(id: 1, name: "Flying Lion Brewery", num_of_employees: 3, market_id: 1)
      expect(vendor).must_be_kind_of FarMar::Vendor
    end

    it "keeps track of vendor id" do
      id = 10
      vendor = FarMar::Vendor.new(id: id, name: "Flying Lion Brewery", num_of_employees: 3, market_id: 1)
      vendor.must_respond_to :id
      vendor.id.must_equal id
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
      name = "test name"
      vendor = FarMar::Vendor.new(id: 1, name: name, num_of_employees: 3, market_id: 1)
      vendor.must_respond_to :name
      vendor.name.must_equal name
    end

    it "keeps track of market_id" do
      m_id = 33
      vendor = FarMar::Vendor.new(id: 1, name: "Flying Lion Brewery", num_of_employees: 3, market_id: m_id)
      vendor.must_respond_to :market_id
      vendor.market_id.must_equal m_id
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
      num = 3
      vendor = FarMar::Vendor.new(id: 1, name: "Flying Lion Brewery", num_of_employees: num, market_id: 12)
      vendor.must_respond_to :num_of_employees
      vendor.num_of_employees.must_equal num
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
end
