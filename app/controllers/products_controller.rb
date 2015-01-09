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
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to(:action => 'show', :id => @product.id)
    else
      render('index')
    end
  end

  def delete
    @product = Product.find(params[:id])
  end
  
  def destroy
    Product.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end

  def product_params
    params.require(:product).permit(:product_name, :description, :category_id, :price, :thumburl, :tax_rate, :product_image)
  end

  def add_to_cart
    # binding.pry
    if order = Product.find(params[:id]).add_to_cart(current_user, params[:qty].values[0].to_i)
      redirect_to order_path(order)
    else
      redirect_to(:action => 'products')
    end
  end

  private :product_params
end
