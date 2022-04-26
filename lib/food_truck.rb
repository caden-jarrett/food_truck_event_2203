require 'pry'
require './lib/item'

class FoodTruck < Item
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    if @inventory.include?(item)
      # binding.pry
      item.quantity
    else
      0
    end
  end

  def stock(item, stock_quantity)
    @inventory[item] += stock_quantity
    # binding.pry
    # quantity = item.quantity
    # quantity += stock_quantity
    # @inventory[item] = quantity
    # binding.pry
    # USED ++ BUT RUBY DIDNT LIKE ADDING TWO INTEGERS TOGETHER AND NOT REPLACING QUANTITY, I HAVE BEEN STUCK ON THIS SINCE 9:30, += is the only way to do this and it is saying that it is a undefined method
  end

  def potential_revenue
    potential_revenue = 0.0
    inventory.sum do |item|
      potential_revenue += (item[0].price * item[1])
    end
    potential_revenue

  end
end
