require 'csv'
require_relative 'spec_helper'

describe "Market" do
  let(:market){ FarMar::Market.new(id: 1, name:"People's Co-op Farmers Market", address:"30th and Burnside", city: "Portland", county: "Multnomah", state: "Oregon", zip: "97282") }
 
  describe "initialize" do
    it "creates a new instance of @market" do
      expect(market).must_be_kind_of FarMar::Market
    end

    it "keeps track of id" do
      market.must_respond_to :id
      market.id.must_equal 1
    end

    it "requires an integer id" do
      proc {
        FarMar::Market.new(id: "not an integer", name: "People's Co-op Farmers Market", address: "30th and Burnside", city: "Portland", county: "Multnomah", state: "Oregon", zip: "97282")
      }.must_raise ArgumentError
    end

    it "requires a positive id" do
      proc {
        FarMar::Market.new(id: -10, name: "People's Co-op Farmers Market", address: "30th and Burnside", city: "Portland", county: "Multnomah", state: "Oregon", zip: "97282")
      }.must_raise ArgumentError
    end

    it "keeps track of name" do
      market.must_respond_to :name
      market.name.must_equal "People's Co-op Farmers Market"
    end

    it "keeps track of address" do
      market.must_respond_to :address
      market.address.must_equal "30th and Burnside"
    end

    it "keeps track of city" do
      market.must_respond_to :city
      market.city.must_equal "Portland"
    end

    it "keeps track of county" do
      market.must_respond_to :county
      market.county.must_equal "Multnomah"
    end

    it "keeps track of state" do
      market.must_respond_to :state
      market.state.must_equal "Oregon"
    end

    it "keeps track of zip" do
      market.must_respond_to :zip
      market.zip.must_equal "97282"
    end
  end

  describe "all" do
    before do
      @markets = FarMar::Market.all
    end
    it "returns an array" do
      @markets.must_be_kind_of Array
    end

    it "returns a collection full of markets" do
      @markets.each do |market|
        market.must_be_kind_of FarMar::Market
      end
    end

    it "returns the correct number of accounts" do
      @markets.size.must_equal 500
    end

    it "gets the first market from the file"  do
      @markets.first.id.must_equal 1
    end

    it "gets the last market from the file" do
      @markets.last.id.must_equal 500
    end
  end

  describe "find" do

    it "returns the first instance of market " do
      id = 1
      market = FarMar::Market.find(1)
      market.id.must_equal id
    end

    it "returns nil if a market does not exist" do
      market = FarMar::Market.find(12334)
      market.must_be_nil
    end

    it "finds the last market" do
      id = 500
      market  = FarMar::Market.find(500)
      market.id.must_equal id
    end
  end
end
