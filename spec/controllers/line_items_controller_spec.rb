require 'rails_helper'

RSpec.describe LineItemsController, :type => :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:order) { FactoryGirl.create(:order, user: user) }
  let(:line_item) { FactoryGirl.create(:line_item, order: order) }

  before do
    sign_in user
  end

  describe "GET new" do
    it "assigns a new line_item" do
      line_item = LineItem.new
      get :new
      expect(assigns(:line_item).id).to eq(line_item.id)
    end
  end

  describe "POST create" do
    it "creates a new line_item" do
      parameters = {:line_item => {order_id: order.id, product_id: line_item.product.id, unit_price: 20.0, quantity: 2, tax: 12.24, total: 44.89}}
      expect{post :create, parameters}.to change(LineItem, :count).by(1)
    end

    it "assigns a newly created line_item as @line_item" do
      post :create, {:line_item => {order_id: order.id, product_id: line_item.product.id, unit_price: 20.0, quantity: 2, tax: 12.24, total: 44.89}}
      expect(assigns(:line_item)).to be_a(LineItem)
      expect(assigns(:line_item)).to be_persisted
    end 

    it "redirects to the created line_item" do
      post :create, {:line_item => {order_id: order.id, product_id: line_item.product.id, unit_price: 20.0, quantity: 2, tax: 12.24, total: 44.89}}
      redirect_to line_items_path
    end 

    it "assigns a newly created but unsaved line_item as @line_item with invalid parameters" do
      allow_any_instance_of(LineItem).to receive(:save).and_return(false)
      post :create, {:line_item => { "unit_price" => -9.99 }}
      expect(response).to render_template("new")
    end             
  end

  describe "GET edit" do
    it "assigns the requested line_item as @line_item" do
      get :edit, {:id => line_item.to_param}
      expect(assigns(:line_item)).to eq(line_item)
    end
  end  

  describe "POST update" do
    it "updates, assigns and redirects_to the requested line_item" do
      post :update, :item_id => line_item.id, :item => { :quantity => "3" }
      expect(response).to redirect_to order_path(order)
    end   
  end  

  describe "POST delete" do
    it "deletes, redirects_to the order path" do
      post :delete, :id => line_item.id
      expect(response).to redirect_to order_path(order)
    end   
  end     
end
