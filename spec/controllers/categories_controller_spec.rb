require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do
  let(:category) { FactoryGirl.create(:category) }

  describe "GET index" do

    it "assigns all categories as @categories" do
      category = Category.all
      get :index
      expect(assigns(:categories)).to eq(category)
    end

    it "renders the template for index page" do
      get :index
      expect(response).to render_template("index")
    end

    it "It should have a status 200" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET New" do
    it "assigning a new category" do
      category = Category.new
      get :new
      expect(assigns(:category).id).to eq(category.id)
    end
  end

  describe "POST create" do
    it "creates a new category" do
      parameters = {category: {name: 'Laptop', thumburl: 'http://www.laptop.com'}}
      # binding.pry
      expect {post :create, parameters}.to change(Category, :count).by(1)
      # binding.pry
    end

    it "assigns a newly created category as @category" do
      post :create, {:category => {name: 'Laptop', thumburl: 'http://www.laptop.com'}}
      expect(assigns(:category)).to be_a(Category)
      # binding.pry
      expect(assigns(:category)).to be_persisted
    end

    it "redirects to the created category" do
      post :create, {:category => {name: 'Laptop', thumburl: 'http://www.laptop.com'}}
      # binding.pry
      redirect_to categories_path
    end

    it "assigns a newly created but unsaved category as @category with invalid parameters" do
      Category.any_instance.stub(:save).and_return(false)
      post :create, {:category => { "name" => "", "thumburl" => "www.laptop.com" }}
      expect(assigns(:category)).to be_a_new(Category)
      # binding.pry
    end
  end

  describe "GET edit" do

  end

  describe "PUT update" do
    it "updates the requested category" do
      category = Category.create!(name: 'laptop', thumburl: 'http://www.laptop.com')
      binding.pry
      Category.any_instance.should_receive(:update).with({ "name" => "kiran" })
      binding.pry
      put :update, {:id => category.to_param, :category => { "name" => "kiran" }}
      binding.pry
    end
  end
end
