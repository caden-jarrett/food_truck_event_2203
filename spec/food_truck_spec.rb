require "./lib/item"
require './lib/food_truck'
require "pry"

RSpec.describe FoodTruck do
  before :each do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  it "exists" do
    expect(@food_truck).to be_a FoodTruck
  end

  it "has attributes" do
    expect(@food_truck.name).to eq "Rocky Mountain Pies"
    expect(@food_truck.inventory).to eq({})
  end

  it "can check items stock of a food truck" do
    expect(@food_truck.check_stock(@item1)).to eq 0
  end

  it "can add items to a food trucks inventory" do
    @food_truck.stock(@item1, 30)
    expect(@food_truck.inventory).to eq({@item1 => 30})
  end

  it "can add items to a food trucks inventory" do
    @food_truck.stock(@item1, 25)
    @food_truck.stock(@item1, 30)
    expect(@food_truck.inventory).to eq({@item1 => 55})
    @food_truck.stock(@item2, 12)
    expect(@food_truck.inventory).to eq({@item1 => 55, @item2 => 12})
  end
end
