class LineItemsController < ApplicationController
  def new
    @line_item = LineItem.new
  end

  def create
    @line_item = LineItem.new(line_item_params)
    if @line_item.save
      puts "Line Item saved"
      redirect_to(:action => 'index')
    else
      binding.pry
      render('new')
    end
  end

  def edit
    binding.pry
    @line_item = LineItem.find(params[:id])
  end

  def update
    # binding.pry
    if order = LineItem.find(params[:item_id]).update_quantity(params[:item][:quantity].to_i)
      redirect_to order_path(order)
    else
      redirect_to product_path(product)
    end
  end

  def delete
    order = LineItem.find(params[:item_id].to_i).remove
    redirect_to order_path(order)
  end

  private

  def line_item_params
    params.require(:line_item).permit(:unit_price, :quantity, :tax, :total, :order_id, :product_id)
  end
end
