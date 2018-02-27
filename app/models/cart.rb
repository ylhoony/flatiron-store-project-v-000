class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    self.line_items.map do |line_item|
      line_item.quantity * line_item.item.price
    end.sum
  end

  def add_item(item_id)
    if line_items.exists?(item_id: item_id)
      line_item = self.line_items.find_by(item_id: item_id)
      line_item.quantity += 1
      line_item
    else
      self.line_items.build(item_id: item_id)
    end
  end

  def checkout
    # new_order = Order.new
    self.line_items.each do |line_item|
      # line_item.order = new_order
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    # new_order.save
    
    user.remove_current_cart
    self.update(status: "submitted")
  end

end
