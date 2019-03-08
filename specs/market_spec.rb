require_relative 'spec_helper'

describe "Market" do
  describe "initialize" do
    it "creates a new instance of market" do
      market = FarMar::Market.new(
                id: 1,
                name: "People's Co-op Farmers Market",
                address: "30th and Burnside",
                city: "Portand",
                county: "Multnomah",
                state: "Oregon",
                zip: "97282"
              )
      expect(market).must_be_kind_of FarMar::Market
    end

    it "keeps track of id" do
      id = 122
      market = FarMar::Market.new(id: id, name: "People's Co-op Farmers Market", address: "30th and Burnside", city: "Portand", county: "Multnomah", state: "Oregon", zip: "97282")
      market.must_respond_to :id
      market.id.must_equal id
    end

    it "requires a positive integer id" do
      proc {
        FarMar::Market.new(id: "not an integer", name: "People's Co-op Farmers Market", address: "30th and Burnside", city: "Portand", county: "Multnomah", state: "Oregon", zip: "97282")  
      }.must_raise ArgumentError
    end

    it "requires a positive id" do
      proc {
        FarMar::Market.new(id: -10, name: "People's Co-op Farmers Market", address: "30th and Burnside", city: "Portand", county: "Multnomah", state: "Oregon", zip: "97282")
      }.must_raise ArgumentError
    end

    it "keeps track of name" do
      name = "test name"
      market = FarMar::Market.new(id: 1, name: name, address: "30th and Burnside", city: "Portand", county: "Multnomah", state: "Oregon", zip: "97282")
      market.must_respond_to :name
      market.name.must_equal name
    end

    it "keeps track of address" do
      address = "test address"
      market = FarMar::Market.new(id: 1, name: "People's Co-op Farmers Market", address: address, city: "Portand", county: "Multnomah", state: "Oregon", zip: "97282")
      market.must_respond_to :address
      market.address.must_equal address
    end

    it "keeps track of city" do
      city = "test city"
      market = FarMar::Market.new(id: 1, name: "People's Co-op Farmers Market", address: "30th and Burnside", city: city, county: "Multnomah", state: "Oregon", zip: "97282")
      market.must_respond_to :city
      market.city.must_equal city
    end

    it "keeps track of county" do
      county = "test county"
      market = FarMar::Market.new(id: 1, name: "People's Co-op Farmers Market", address: "30th and Burnside", city: "Portand", county: county, state: "Oregon", zip: "97282")
      market.must_respond_to :county
      market.county.must_equal county
    end

    it "keeps track of state" do
      state = "test state"
      market = FarMar::Market.new(id: 1, name: "People's Co-op Farmers Market", address: "30th and Burnside", city: "Portand", county: "Multnomah", state: state, zip: "97282")
      market.must_respond_to :state
      market.state.must_equal state
    end

    it "keeps track of zip" do
      zip = "test zip"
      market = FarMar::Market.new(id: 1, name: "People's Co-op Farmers Market", address: "30th and Burnside", city: "Portand", county: "Multnomah", state: "Oregon", zip: zip)
      market.must_respond_to :zip
      market.zip.must_equal zip
    end
  end
end
