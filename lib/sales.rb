require 'csv'

module FarMar
  class Sale
    attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

    def initialize id:, amount:, purchase_time:, vendor_id:, product_id:
      unless id > 0 && id.instance_of?(Integer)
        raise ArgumentError, "ID must be a positive integer, given #{id}"
      end
      
      @id = id
      @amount = amount
      @purchase_time = purchase_time
      @vendor_id = vendor_id
      @product_id = product_id
    end

    def self.all_sales
      CSV.read("support/sales.csv").map do |line|
        Sales.new(line[0].to_i, line[1], line[2], line[3], line[4])
      end
    end
    
    def self.find(id)
      all_sales.select { |sale| sale.id == id }.first
    end
  end
end