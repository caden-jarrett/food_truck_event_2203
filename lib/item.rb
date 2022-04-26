require 'pry'

class Item
  attr_reader :name, :price, :quantity
  def initialize(item_info)
    @name = item_info[:name]
    @price = item_info[:price].delete("$").to_f
    @quantity = 0
  end
end
