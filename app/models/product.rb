class Product < ActiveRecord::Base
  include Image
  belongs_to :category
  has_many :line_items

  validates :name, :category_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :tax_rate, numericality: { greater_than_or_equal_to: 0}

  def add_to_cart(current_user, quantity)
    order = Order.find_by(user_id: current_user.id, status: "cart")
    order ||= Order.create(user_id: current_user.id, status: "cart")

    if order 
      if order.line_items
        line_item = order.line_items.where(product_id: id).first
        if line_item
          line_item.update_attributes(:quantity => line_item.quantity + quantity )
        else
          li = LineItem.create(product_id: id, quantity: quantity, order_id: order.id)        
        end
      end   
      return order
    end
    false
  end
end
