class Shop

  def initialize(price_table, special_offer = nil)
    @price_table = price_table
    @special_offer = special_offer 
  end

  def checkout(units)
    @total = 0
    return -1 if  illegal_entry?(units)
    calculate_price(units)
  end

  private

  attr_reader :price_table, :special_offer

  def calculate_price(units)
    sorted_units = sort_units(units)
    sorted_units.each do | unit, quantity |
      updated_quantity = implement_offer(unit, quantity)
      @total += price_table[unit] * updated_quantity
    end 
    @total
  end

  def implement_offer(unit, quantity)
    special_offer.each do | name, reduced_price |
      discounted_unit = name.split('')[1]
      discounted_quantity =  name.split('')[0].to_i
      if unit == discounted_unit && quantity % discounted_quantity == 0
        loop do 
        @total += reduced_price 
        quantity -= discounted_quantity
        break if quantity < discounted_quantity
        end
      end
    end
    quantity
  end  

  def sort_units(units)
    sorted_units = {}
    units.split('').map do |unit|
      sorted_units[unit].nil? ? sorted_units[unit] = 1 : sorted_units[unit] += 1
    end
    sorted_units
  end

  def illegal_entry?(units)
    units.split('').map { |unit| price_table[unit].nil? }.inject(:|)
  end
 
end