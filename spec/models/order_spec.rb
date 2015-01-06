require 'rails_helper'

RSpec.describe Order, :type => :model do
  let(:order) { FactoryGirl.create(:order) }
  let(:line_item) { FactoryGirl.create(:line_item, order: order) }

  it "Status should be either Cart, Cancelled, Pending, Checkout" do
    expect(order.status).to match(/(cart|checkout|payment_complete|cancelled)/)
  end
  it "Billing address should not be empty" do
    expect(order.billing_address).not_to be_empty
  end

  it "Shipping address should not be empty" do
    expect(order.shipping_address).not_to be_empty
  end  

  it "Subtotal should be positive and greater than zero" do
    expect(order.subtotal).to be >= 0
  end

  it "Tax should be positive and greater than zero" do
    expect(order.tax).to be >= 0   
  end

  it "Total should be positive and greater than zero" do
    expect(order.tax).to be >= 0   
  end

  it "total is set to zero as there are no line items" do
    if order.line_items.count == 0
      order.total = 0.00
    end
  end

  it "results of subtotal, tax, total" do
    binding.pry
    order.line_items.push(line_item)
    binding.pry
    if order.line_items.count == 1
      binding.pry
      # order.subtotal = 
    end
  end  
end
