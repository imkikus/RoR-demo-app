require 'rails_helper'

RSpec.describe LineItem, :type => :model do
  let(:line_item) { FactoryGirl.create(:line_item) }

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
end
