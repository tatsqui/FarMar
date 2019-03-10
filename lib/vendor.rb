module FarMar

  class Vendor
    attr_reader :id, :name, :market_id, :num_of_employees, :vendors

    def initialize(id:, name:, num_of_employees:, market_id:)
      unless id.instance_of?(Integer) && id > 0
        raise ArgumentError, "ID must be a positive number, given #{id}..."
      end

      unless market_id.instance_of?(Integer) && market_id > 0
        raise ArgumentError, "Market ID must be a positive integer, give #{market_id}"
      end

      unless num_of_employees.instance_of?(Integer) && num_of_employees > 0
        raise ArgumentError, "Number of employees must be a positive integer, given #{num_of_employees}..."
      end

      @id = id
      @name = name
      @num_of_employees = num_of_employees
      @market_id = market_id
      @vendors = []
    end

    def self.all
      return @vendors
    end

  end
end
