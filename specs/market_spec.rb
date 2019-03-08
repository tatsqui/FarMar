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
      market = FarMar::Market.new(
                id: id,
                name: "People's Co-op Farmers Market",
                address: "30th and Burnside",
                city: "Portand",
                county: "Multnomah",
                state: "Oregon",
                zip: "97282"
              )
      market.must_respond_to :id
      market.id.must_equal id
    end
  end
end
