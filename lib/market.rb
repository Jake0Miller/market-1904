class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map {|vendor| vendor.name}
  end

  def vendors_that_sell(item)
    @vendors.find_all {|vendor| vendor.inventory.has_key? item}
  end

  def sorted_item_list
    @vendors.each_with_object([]) do |vendor,arr|
      arr << vendor.inventory.keys
    end.flatten.uniq.sort
  end

  def total_inventory
    @vendors.each_with_object(Hash.new(0)) do |vendor,hash|
      vendor.inventory.each { |item,num| hash[item] += num }
    end
  end
end
