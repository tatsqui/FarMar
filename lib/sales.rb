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
  end
end