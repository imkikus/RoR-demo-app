class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items

  validates :billing_address, :shipping_address, presence: true, if: :status_checkout?
  validates :status, :user_id, presence: true
  after_initialize :set_default_values
  validates :status, inclusion: { in: %w(cart checkout payment_complete cancelled),
    message: "%{value} is not a valid status" }

  def status_checkout?
    self.status == "checkout"
  end

  def set_default_values
    self.status ||= ''
    self.total ||= 0
    self.subtotal ||= 0
  end

  def recalculate
    self.total = 0.to_f
    self.tax = 0.to_f
    self.subtotal = 0.to_f
    line_items.each do |l|
      self.subtotal += (l.unit_price * l.quantity)
      self.tax += l.tax
      self.total = subtotal + tax
    end
    self.save!
  end

  def address_credit_card_details(order_details)
    od = order_details
    self.billing_address = od["billing_address"]["value"]
    self.shipping_address = od["shipping_address"]["value"]
    self.save!
    credit_card_number = od["card_number"]["value"]
    expiry_date = od["expiry_date"]["value"]
    cvv = od["cvv"]["value"]
    return od["id"]
  end

  def checkout
    self.status = "checkout"
    self.save!
    return self.id
  end

  def cancel
    self.update_attributes(:status => 'cancelled')
    self
  end
end
