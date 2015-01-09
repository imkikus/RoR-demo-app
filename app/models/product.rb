class Product < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  validates :product_name, :category_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :tax_rate, numericality: { greater_than_or_equal_to: 0}
  validates :thumburl, format: { with: URI::regexp(%w(http https)) }

  has_attached_file :product_image, :styles => { :medium => "300x300>", :thumb => "100x100>"}, :default_url => "/images/:style/no_image.png"
  validates_attachment_content_type :product_image, :content_type => /\Aimage\/.*\Z/

  def add_to_cart(current_user, quantity)
    order = Order.find_by(user_id: current_user.id, status: "cart")
    order ||= Order.create(user_id: current_user.id, status: "cart")

    if order     
      li = LineItem.create(product_id: id, quantity: quantity, order_id: order.id)        
      return order
    end
    false
  end
end
