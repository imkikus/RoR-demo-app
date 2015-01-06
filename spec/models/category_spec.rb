require 'rails_helper'

RSpec.describe Category, :type => :model do
  let(:category) { FactoryGirl.create(:category) }
  let(:category_nil_values) { FactoryGirl.create(:category, :category_empty_info) }

  it "Name should not be empty" do 
    expect(category.name).not_to be_empty
  end

  it "Thumbnail URL should be valid" do
    expect(category.thumburl).to match(/^http(s?)\W/)
  end

  context "raising errors for NULL values" do
    it "raised error for no name" do    
      expect{
        # category.name = nil;
        category_nil_values.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "raised error for no thumburl" do    
      expect{
        # category.thumburl = nil;
        category_nil_values.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end  
  end  
end
