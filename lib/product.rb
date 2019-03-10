require 'csv'
module FarMar
  class Product
    attr_reader :id, :name, :vendor_id

    def initialize(id, name, vendor_id)
      unless id.instance_of?(Integer) && id > 0
        raise ArgumentError, "ID must be a positive number, given #{id}..."
      end

      unless vendor_id.instance_of?(Integer) && vendor_id > 0
        raise ArgumentError, "Vendor ID must be a positive number, given #{vendor_id}..."
      end

      @id = id
      @name = name
      @vendor_id = vendor_id
    end

    def self.all
      CSV.read("support/products.csv").map do |line|
        Product.new(line[0].to_i, line[1], line[2].to_i)
      end
    end

    def self.find(id)
      all.select { |prod| prod.id == id }.first
    end
  end
end
