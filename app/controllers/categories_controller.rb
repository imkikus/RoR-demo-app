class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      flash[:notice] = "Category created successfully"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])    
    if @category.update_attributes(category_params)
      # binding.pry
      if params[:delete]
        # binding.pry
        @category.category_image = nil
        @category.save
      end
      redirect_to(:action => 'show', :id => @category.id)
    else
      render('index')
    end
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products
  end

  def delete
    @category = Category.find(params[:id])
    binding.pry
  end


  def destroy
    Category.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end

  private

  def category_params
    params.require(:category).permit(:name, :thumburl, :category_image)
  end
end
