require './lib/item'
require './lib/food_truck'

class Event
  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    ft_thatsells = []
    ft_that_doesnt = []
    @food_trucks.each do |truck|
      if truck.inventory.include?(item)
        ft_thatsells << truck
      elsif !truck.inventory.include?(item)
        ft_that_doesnt << truck
      end
    end
    return ft_thatsells
  end

  def sorted_item_list
    items = Array.new(0)
    @food_trucks.each do |truck|
      truck.inventory.each do |item|
        binding.pry
        items << item[0] if !items.include?(item[0])
      end
    end
    return items.sort
  end
end
