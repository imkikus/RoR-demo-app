require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do
  # let(:category) { FactoryGirl.create(:category) }
  let(:user) { FactoryGirl.create(:user) }
  let(:product) { FactoryGirl.create(:product) }
  
  before do
    sign_in user
  end
  # it "signed_in? user" do
    # binding.pry
  # end

  describe "GET index" do

    binding.pry
    def do_get
      get :index
    end

    it "assigns all products as @products" do
      product = Product.all
      do_get
      expect(assigns(:products)).to eq(product)
      binding.pry
    end
  end
end
