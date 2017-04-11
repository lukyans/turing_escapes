class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_item(escape_id)
    contents[escape_id.to_s] ||= 0
    contents[escape_id.to_s] +=1
  end

  def find_escapes
    cart_items = []
    contents.each do |id, count|
      cart_items << Escape.find(id.to_i)
    end
    cart_items
  end

  def total_price
    cart_prices = []
    contents.each do |id, count|
      cart_prices << Escape.find(id.to_i).price * count
    end
    cart_prices.reduce(:+)
  end

  def remove_item(item_id)
    contents.delete(item_id)
  end

end
