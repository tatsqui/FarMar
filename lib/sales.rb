require 'csv'

module FarMar
  class Sale
    attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id, :all, :find

    def initialize id:, amount:, purchase_time:, vendor_id:, product_id:
      unless id > 0 && id.instance_of?(Integer) && vendor_id.instance_of?(Integer) && vendor_id >0 && product_id.instance_of?(Integer) && product_id > 0
        raise ArgumentError, "ID must be a positive integer, given #{id}"
      end
      
      @id = id
      @amount = amount
      @purchase_time = purchase_time
      @vendor_id = vendor_id
      @product_id = product_id
    end

    def self.all
      CSV.read("support/sales.csv").map do |line|
        Sale.new(id: line[0].to_i, amount: line[1].to_i, purchase_time: line[2], vendor_id: line[3].to_i, product_id: line[4].to_i)
      end
    end
    
    def self.find(id)
      all_sales.select { |sale| sale.id == id }.first
    end
  end
end