require "pry"

class CashRegister
    attr_accessor :total, :discount, :title, :quantity, :items 

    
  def initialize(discount = nil)
    @discount = discount
    @total = 0 
    @items = []
  end
  
  def total
    @total 
  end
  
  def add_item(title, price, quantity = nil)
    @title = title 
    @price = price
    @quantity = quantity
    @quantity ? (@items << ((@title + ' ')* @quantity).split(' ')).flatten! : @items << @title
    @quantity ? @total += @price * @quantity : @total += @price
  end
  
  def apply_discount
    if @discount 
    @price = @price - @price * @discount / 100
    @total = @price 
    "After the discount, the total comes to $#{@price.to_i}."
  else
    "There is no discount to apply."
  end 
  end
  
  def items
    @items 
  end
  
  def void_last_transaction
    @total -= @price 
  end 
  
end 
