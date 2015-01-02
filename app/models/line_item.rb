class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates :order_id, :product_id, :quantity, presence: true
  before_save :get_calculate_price

  after_save :order_recalculate
  after_destroy :order_recalculate

  def get_calculate_price
    # binding.pry
    if product_id.nil?
      puts "No product exists with the id"
    else
      self.unit_price ||= product.price
      # binding.pry
      self.tax = ((unit_price * quantity) * (product.tax_rate / 100))
      self.total = ((unit_price * quantity) + tax)
      hello = "Hello World"
    end
  end

  def order_recalculate
    order.recalculate
  end

  def update_quantity(quantity)
    # binding.pry
    if order
      self.quantity = quantity
      self.save
      return order
    end
    false
  end

  def remove
    self.destroy
    order
  end
end
