require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:order) { FactoryGirl.create(:order) }

  # binding.pry

  describe "GET show" do
    it "assigns the requested orders as @orders" do
      get :show, {:id => order.to_param}
      # binding.pry
      expect(assigns(:order)).to eq order
      # binding.pry
    end
  end

  describe "GET New" do
    it "assigning a new order" do
      order = Order.new
      get :new
      expect(assigns(:order).id).to eq(order.id)
    end
  end

  describe "POST create" do
    it "creates a new order" do
      parameters = {order: {status: 'cart', billing_address: 'sdfasfd', shipping_address: 'dsfgbdvfb', subtotal: '9.99', tax: '9.99', total: '9.99' }}
      # binding.pry
      expect{post :create, parameters}.to change(Order, :count).by(1)
      # binding.pry
    end

    it "assigns a newly created order as @order" do
      post :create, {:order => {status: 'cart', billing_address: 'sdfasfd', shipping_address: 'dsfgbdvfb', subtotal: 9.99, tax: 9.99, total: 9.99}}
      expect(assigns(:order)).to be_a(Order)
      binding.pry
      # expect(assigns(:order)).to be_persisted
    end

    it "redirects to the created order" do
      post :create, :order => {status: 'cart', billing_address: 'sdfasfd', shipping_address: 'dsfgbdvfb', subtotal: 9.99, tax: 9.99, total: 9.99}
      # binding.pry
      redirect_to orders_path
    end

    it "assigns a newly created but unsaved order as @order with invalid parameters" do
      allow_any_instance_of(Order).to receive(:save).and_return(false)
      post :create, {:order => { status: "waiting" }}
      expect(response).to render_template("new")
      # binding.pry
    end
  end     
end
