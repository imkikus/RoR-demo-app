require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:order) { FactoryGirl.create(:order, user: user) }

  before do
    sign_in user
  end

  describe "GET show" do
    it "assigns the requested orders as @orders" do
      get :show, {:id => order.to_param}
      expect(assigns(:order)).to eq order
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
      parameters = {order: {user_id: user.id, status: 'cart', billing_address: 'sdfasfd', shipping_address: 'dsfgbdvfb', subtotal: 9.99, tax: 9.99, total: 9.99 }}
      expect{post :create, parameters}.to change(Order, :count).by(1)
    end

    it "assigns a newly created order as @order" do
      post :create, {:order => {user_id: user.id, status: 'cart', billing_address: 'sdfasfd', shipping_address: 'dsfgbdvfb', subtotal: 9.99, tax: 9.99, total: 9.99}}
      expect(assigns(:order)).to be_a(Order)
      expect(assigns(:order)).to be_persisted
    end

    it "redirects to the created order" do
      post :create, { :order => {user_id: user.id, status: 'cart', billing_address: 'sdfasfd', shipping_address: 'dsfgbdvfb', subtotal: 9.99, tax: 9.99, total: 9.99}}
      redirect_to orders_path
    end

    it "assigns a newly created but unsaved order as @order with invalid parameters" do
      allow_any_instance_of(Order).to receive(:save).and_return(false)
      post :create, {:order => { status: "waiting" }}
      expect(response).to render_template("new")
    end
  end 

  describe "POST edit details" do
    it "assigns the requested order as @order" do
      post :edit_details, id: order.id, billing_address: "asdfasdf", shipping_address: "asdgvasdv", card_number:"42424242424242", expiry_date: "10/2020", cvv: 123
      expect(response).to redirect_to order_path
    end
  end 

  describe "POST checkout" do
    it "changes the status to checkout" do
      post :checkout, id: order.id, :order => { status: "checkout" }
      expect(response).to redirect_to order_path
    end
  end

  describe "POST cancel" do
    it "changes the status to cancelled" do
      post :cancel, id: order.id, :order => { status: "cancelled" }
      expect(response).to redirect_to order_path
    end
  end        
end
