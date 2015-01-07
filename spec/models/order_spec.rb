require 'rails_helper'

RSpec.describe Order, :type => :model do
  let(:order) { FactoryGirl.create(:order) }
  let(:line_item1) { FactoryGirl.create(:line_item, order: order) }
  let(:line_item2) { FactoryGirl.create(:line_item, order: order) }
  let(:line_item3) { FactoryGirl.create(:line_item, order: order) }

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

  context "results of subtotal, tax, total" do
    it "order having exactly one item" do
      order.line_items.push(line_item1)
    end

    it "order having more than one item" do
      order.line_items.push(line_item1)
      order.line_items.push(line_item2)
      order.line_items.push(line_item3)     
    end    
  end 

  context "Order" do
    it "cancelled correctly" do
      order.cancel
      expect(order.status).to match(/cancelled/)
    end
  end 
end
