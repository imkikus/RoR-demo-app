require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:order) { FactoryGirl.create(:order, user: user) }

  before do
    sign_in user
  end

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
      # binding.pry
    end
  end

  describe "POST create" do
    it "creates a new order" do
      parameters = {order: {user_id: user.id, status: 'cart', billing_address: 'sdfasfd', shipping_address: 'dsfgbdvfb', subtotal: 9.99, tax: 9.99, total: 9.99 }}
      # binding.pry
      expect{post :create, parameters}.to change(Order, :count).by(1)
      # binding.pry
    end

    it "assigns a newly created order as @order" do
      post :create, {:order => {user_id: user.id, status: 'cart', billing_address: 'sdfasfd', shipping_address: 'dsfgbdvfb', subtotal: 9.99, tax: 9.99, total: 9.99}}
      expect(assigns(:order)).to be_a(Order)
      # binding.pry
      expect(assigns(:order)).to be_persisted
    end

    it "redirects to the created order" do
      post :create, { :order => {user_id: user.id, status: 'cart', billing_address: 'sdfasfd', shipping_address: 'dsfgbdvfb', subtotal: 9.99, tax: 9.99, total: 9.99}}
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

  describe "POST edit details" do
    it "assigns the requested order as @order" do
      binding.pry
      post :edit_details, { id: order.id }, { :order => {user_id: user.id, billing_address: 'example', shipping_address: 'example', card_number: 123452334, expiry_date: 1020, cvv: 123}}
      # redirect_to order_path
      # binding.pry
      expect(assigns(:order)).to eq(order)
    end
  end 

  describe "POST checkout" do
    it "changes the status to checkout" do
      post :checkout, id: order.id, :order => { status: "checkout" }
      # binding.pry
      expect(response).to redirect_to order_path
    end
  end

  describe "POST cancel" do
    it "changes the status to cancelled" do
      post :cancel, id: order.id, :order => { status: "cancelled" }
      # binding.pry
      expect(response).to redirect_to order_path
    end
  end        
end
