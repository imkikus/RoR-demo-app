class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      flash[:notice] = "Order successfully created"
      redirect_to(:action => 'index')
    else
      flash[:alert] = "Order creation failed"
      render('new')
    end
  end

  def edit_details
    order = Order.find(params[:id]).address_credit_card_details(params)
    # binding.pry
    flash[:notice] = "Address/Credit card details successfully updated"
    redirect_to order_path(order)
  end

  def checkout
    order = Order.find(params[:id]).checkout
    flash[:notice] = "Order status successfully updated (checkout)"
    redirect_to order_path(order)
  end

  def cancel
    order = Order.find(params[:id]).cancel
    flash[:notice] = "Order status successfully updated (cancelled)"
    redirect_to order_path(order)
  end

  private

  def order_params
    params.require(:order).permit(:status, :shipping_address, :user_id)
  end
end
