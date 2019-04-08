class Shop

  attr_reader :price_table

  def initialize(price_table)
    @price_table = price_table
  end

  def checkout(units)
   price_table[unit] || -1
  end
 
end