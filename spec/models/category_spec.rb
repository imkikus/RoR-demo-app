require 'rails_helper'

RSpec.describe Category, :type => :model do
  let(:category) { FactoryGirl.create(:category) }

  it "Name should not be empty" do 
    expect(category.name).not_to be_empty
  end
  it "Thumbnail URL should be valid" do
    expect(category.thumburl).to match(/^http(s?)\W/)
  end
end
