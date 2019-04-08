class Shop

  attr_reader :price_table

  def initialize(price_table)
    @price_table = price_table
  end

  def checkout(units)
    unit_prices = []
    units.split('').each do |unit|
      return -1 if illegal?(unit)
      unit_prices << price_table[unit.to_s]
    end
    print unit_prices
    unit_prices.inject(:+)
  end

  private

  def illegal?(unit)
    price_table[unit.to_s].nil?
  end
 
end