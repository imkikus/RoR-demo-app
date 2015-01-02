require 'rails_helper'

RSpec.describe Product, :type => :model do
  let(:product) { FactoryGirl.create(:product) }

  it "Name should not be empty" do
    expect(product.product_name).not_to be_empty
  end
  
  it "Description should not be empty" do
    expect(product.description).not_to be_empty
  end   

  it "Price should be a positive floating point value" do
    expect(product.price).to be >= 0 
  end

  it "Thumbnail URL should be valid" do
    expect(product.thumburl).to match(/^http(s?)\W/)
  end

  it "Tax rate should be a  positive floating point value" do
    expect(product.tax_rate).to be >= 0
  end  
end
