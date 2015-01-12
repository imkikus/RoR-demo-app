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
      flash[:notice] = "Category successfully created"
      redirect_to(:action => 'index')
    else
      flash[:alert] = "Creation of category failed"
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
        @category.image = nil
        @category.save
      end
      flash[:notice] = "Category successfully updated"
      redirect_to(:action => 'show', :id => @category.id)
    else
      flash[:alert] = "Updating category failed"
      render('index')
    end
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products
  end

  def delete
    @category = Category.find(params[:id])
    # binding.pry
  end


  def destroy
    Category.find(params[:id]).destroy
    flash[:notice] = "Selected category successfully deleted"
    redirect_to(:action => 'index')
  end

  private

  def category_params
    params.require(:category).permit(:name, :description, :image)
  end
end
