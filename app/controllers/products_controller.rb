class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully created"
      redirect_to(:action => 'index')
    else
      flash[:alert] = "Product creation failed"
      render('new')
    end
  end

  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:notice] = "Product successfully updated"
      redirect_to(:action => 'show', :id => @product.id)
    else
      flash[:alert] = "Product updation failed"
      render('index')
    end
  end

  def delete
    @product = Product.find(params[:id])
  end
  
  def destroy
    Product.find(params[:id]).destroy
    flash[:notice] = "Product successfully deleted"
    redirect_to(:action => 'index')
  end

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :price, :tax_rate, :image)
  end

  def add_to_cart
    # binding.pry
    if order = Product.find(params[:id]).add_to_cart(current_user, params[:qty].values[0].to_i)
      flash[:notice] = "Product successfully added to cart"
      redirect_to order_path(order)
    else
      flash[:alert] = "Product was not added to cart"
      redirect_to(:action => 'products')
    end
  end

  private :product_params
end
