require 'rails_helper'

RSpec.describe LineItem, :type => :model do
  let(:order) { FactoryGirl.create(:order) }
  let(:line_item) { FactoryGirl.create(:line_item, order: order) }

  it "Unit Price should be a valid floating value greater than or equal to zero" do
    expect(line_item.unit_price).to be >=0
  end 

  it "Quantity should be a valid integer greater than or equal to zero" do
    expect(line_item.quantity).to be >=0
  end 

  it "Tax should be a valid floating value greater than or equal to zero" do
    expect(line_item.tax).to be >=0
  end

  it "Total should be a valid floating value greater than or equal to zero" do
    expect(line_item.total).to be >=0
  end

  it "calcualte Line Item unit_price, tax and total" do
    expect(line_item.unit_price).to eq(line_item.product.price)
    expect(line_item.tax).to eq((line_item.unit_price * line_item.quantity) * (line_item.product.tax_rate/100))
    expect(line_item.total).to eq((line_item.unit_price * line_item.quantity) + line_item.tax)
  end

  it "update the quantity and recalculate the totals of line item and order" do
    line_item.update_quantity(5)
    expect(line_item.quantity).to eq(5)
    order.line_items[0].update_quantity(5)
    expect(order.total).to eq(line_item.total)
  end

  it "recalculate the order total on deleting the line item" do
    line_item.remove
  end
end
