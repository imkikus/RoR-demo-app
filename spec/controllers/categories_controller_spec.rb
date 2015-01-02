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
      parameters = {category: {name: 'imkikus', thumburl: 'http://www.example.com'}}
      # binding.pry
      expect {post :create, parameters}
      # binding.pry
    end

    it "assigns a newly created category as @category" do
      post :create, {:category => {name: 'imkikus', thumburl: 'http://www.example.com'}}
      expect(assigns(:category)).to be_a(Category)
      expect(assigns(:category)).to be_persisted
    end

    it "redirects to the created category" do
      post :create, {:category => {name: 'imkikus', thumburl: 'http://www.example.com'}}
      binding.pry
      expect(response).to redirect_to(Category.last)
    end
  end

end
