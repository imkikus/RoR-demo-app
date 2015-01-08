require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do
  let(:category) { FactoryGirl.create(:category) }

  describe "GET index" do

    def do_get
      get :index
    end

    it "assigns all categories as @categories" do
      category = Category.all
      do_get
      expect(assigns(:categories)).to eq(category)
    end

    it "renders the template for index page" do
      do_get
      expect(response).to render_template("index")
    end

    it "status OK" do
      do_get
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
      allow_any_instance_of(Category).to receive(:save).and_return(false)
      post :create, {:category => { "thumburl" => "www.laptop.com" }}
      expect(response).to render_template("new")
      # binding.pry
    end
  end

  describe "GET edit" do
    it "assigns the requested category as @category" do
      category = Category.create!(name: 'laptop', thumburl: 'http://www.laptop.com')
      get :edit, {:id => category.to_param}
      assigns(:category).should eq(category)
      # binding.pry
    end
  end

  describe "PUT update" do
    it "updates, assigns and redirects_to the requested category" do
      category = Category.create!(name: 'laptop', thumburl: 'http://www.laptop.com')
      # expect_any_instance_of(Category).to receive(:update).with({ "name" => "kiran" })
      put :update, {:id => category.to_param, :category => { "name" => "kiran" }}
      assigns(:category).should eq(category)
      expect(response).to redirect_to category_path
      # binding.pry
    end   
  end

  describe "DELETE destroy" do
    it "destroys the requested category" do
      category = Category.create!(name: 'laptop', thumburl: 'http://www.laptop.com')
      # binding.pry
      expect {
        delete :destroy, {:id => category.to_param}
      }.to change(Category, :count).by(-1)
      expect(response).to redirect_to categories_path
      # binding.pry
    end
  end  
end
