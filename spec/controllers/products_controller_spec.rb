require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do
  # let(:category) { FactoryGirl.create(:category) }
  let(:user) { FactoryGirl.create(:user) }
  let(:product) { FactoryGirl.create(:product) }
  
  before do
    sign_in user
  end

  describe "GET index" do

    def do_get
      get :index
    end

    it "assigns all products as @products" do
      product = Product.all
      do_get
      expect(assigns(:products)).to eq(product)
      # binding.pry
    end
  end

  describe "GET show" do
    it "assigns the requested products as @products" do
      get :show, {:id => product.to_param}
      # binding.pry
      expect(assigns(:product)).to eq product
      # binding.pry
    end
  end 

  describe "GET new" do
    it "assigning a new product" do
      product = Product.new
      get :new
      expect(assigns(:product).id).to eq(product.id)
    end
  end

  describe "POST create" do
    it "creates a new product" do
      parameters = {product: {name: 'Test Product', description: "Brief description of the product", category_id: 1234, price: 9.99, tax_rate: 9.99}}
      # binding.pry
      expect {post :create, parameters}.to change(Product, :count).by(1)
      # binding.pry
    end 

    it "assigns a newly created product as @product" do
      post :create, {:product => {name: 'Test Product', description: "Brief description of the product", category_id: 1234, price: 9.99, tax_rate: 9.99}}
      expect(assigns(:product)).to be_a(Product)
      # binding.pry
      expect(assigns(:product)).to be_persisted
    end 

    it "redirects to the created product" do
      post :create, {:product => {name: 'Test Product', description: "Brief description of the product", category_id: 1234, price: 9.99, tax_rate: 9.99}}
      redirect_to products_path
    end 

    it "assigns a newly created but unsaved product as @product with invalid parameters" do
      allow_any_instance_of(Product).to receive(:save).and_return(false)
      post :create, {:product => { "description" => "About laptop" }}
      expect(response).to render_template("new")
      # binding.pry
    end             
  end

  describe "GET edit" do
    it "assigns the requested product as @product" do
      product = Product.create!(name: 'Test Product', description: "Brief description of the product", category_id: 1234, price: 9.99, tax_rate: 9.99)
      get :edit, {:id => product.to_param}
      expect(assigns(:product)).to eq(product)
      # binding.pry
    end
  end  

  describe "PUT update" do
    it "updates, assigns and redirects_to the requested product" do
      product = Product.create!(name: 'Test Product', description: "Brief description of the product", category_id: 1234, price: 9.99, tax_rate: 9.99)
      # expect_any_instance_of(Category).to receive(:update).with({ "name" => "kiran" })
      put :update, {:id => product.to_param, :product => { "name" => "laptop" }}
      assigns(:product).should eq(product)
      expect(response).to redirect_to product_path
      # binding.pry
    end   
  end  

  describe "DELETE destroy" do
    it "destroys the requested product" do
      product = Product.create!(name: 'Test Product', description: "Brief description of the product", category_id: 1234, price: 9.99, tax_rate: 9.99)
      # binding.pry
      expect {
        delete :destroy, {:id => product.to_param}
      }.to change(Product, :count).by(-1)
      expect(response).to redirect_to products_path
      # binding.pry
    end
  end   

  # describe "POST add to cart" do
  #   it "add the product to the cart" do
  #     post :add_to_cart
  #   end
  # end

  describe "Product" do
    it "validates for the availability of an image" do
      expect(Product).to have_attached_file(:image)
    end
    # it "validates the presence of attachment" do
    #   expect(Product).to validate_attachment_presence(:image)
    # end
    it "validates for an attachment of image" do 
      expect(Product).to validate_attachment_content_type(:image).
        allowing('image/png', 'image/gif', 'image/jpg').
        rejecting('text/plain', 'text/xml')
    end

    it "validates for the non-availability of the image" do
      allow_any_instance_of(Product).to receive(:save).and_return(false)
      post :create, {:product => { image: nil }}
      expect(response).to render_template("new")
      # product.should have(1).error_on(:image)
      # binding.pry
    end
    # binding.pry
    # it { should validate_attachment_presence(:image) }
    # it "should be valid" do
    #   binding.pry
    #   image = File.new('#{Rails.root}/spec/fixtures/images/google.jpg', 'image/jpeg', :binary)
    #   expect(FactoryGirl.build(:pin, image: image)).to be_valid
    # end
  end
end
