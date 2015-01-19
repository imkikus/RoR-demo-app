require 'rails_helper'

RSpec.describe Product, :type => :model do
  let(:product) { FactoryGirl.create(:product) }
  let(:product_nil_values) { FactoryGirl.create(:product, :product_empty_info) }
  let(:current_user) { FactoryGirl.create(:user) }
  let(:order) { FactoryGirl.create(:order, user: current_user) }
  let(:line_item) { FactoryGirl.create(:line_item, order: order) }

  it "Name should not be empty" do
    expect(product.name).not_to be_empty
  end
  
  it "Description should not be empty" do
    expect(product.description).not_to be_empty
  end   

  it "Price should be a positive floating point value" do
    expect(product.price).to be >= 0 
  end

  it "Detailed description" do
    expect(product.description).not_to be_empty
  end

  it "Tax rate should be a  positive floating point value" do
    expect(product.tax_rate).to be >= 0
  end 

  context "raising errors for NULL values" do
    it "raise error for no name" do
      expect{
        product_nil_values.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "raise error for no description" do
      expect{
        product_nil_values.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end  

    it "raise error for no price" do
      expect{
        product_nil_values.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end  

    it "raise error for no thumburl" do
      expect{
        product_nil_values.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end 

    it "raise error for no tax rate" do
      expect{
        product_nil_values.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end                 
  end 

  context "raising errors for invalid values" do
    it "raise error for negative price" do
      expect{
        product.price = -9.99
        product.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end    

    it "raise error for invalid price" do
      expect(product.price).not_to match(/[^a-zA-Z]/)
    end

    it "raise error for negative tax rate" do
      expect{
        product.tax_rate = -9.99
        product.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end 

    it "raise error for invalid tax rate" do
      expect(product.tax_rate).not_to match(/[^a-zA-Z]/)
    end  
  end

  it "should increase the count of line item by 1" do
    expect { 
      product.add_to_cart(current_user, 1) 
    }.to change(LineItem, :count).by(1)   
  end

  it "adding the same item twice into the cart, line item quantity increases by 1" do
    # binding.pry
    expect{ 
      product.add_to_cart(current_user, 1) 
      product.add_to_cart(current_user, 1) 
      # line_item.product_id == line_item.product[:id]
      # binding.pry
    }.to change(LineItem, :count).by(1)      
    # binding.pry
    expect(LineItem.first.quantity).to eq(2)
  end
end
