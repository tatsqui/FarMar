require 'csv'
module FarMar

  class Market
    attr_reader :id, :name, :address, :city, :county, :state, :zip

    def initialize id:, name:, address:, city:, county:, state:, zip:
      unless id.instance_of?(Integer) && id > 0
        raise ArgumentError, "ID must be a positive integer. Got: #{id}..."
      end

      @id = id
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
    end

    def self.all
      CSV.read("support/markets.csv").map do |line|
        Market.new(id: line[0].to_i, name: line[1], address: line[2], city: line[3], county: line[4], state: line[5], zip: line[6])
      end
    end

    def self.find(id)
      all.select { |m| m.id == id }.first
    end

  end

end
