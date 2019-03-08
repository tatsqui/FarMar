module FarMar

  class Market
    attr_reader :id, :name, :address, :city, :county, :state, :zip

    def initialize (id:, name:, address:, city:, county:, state:, zip:)
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

  end

end
